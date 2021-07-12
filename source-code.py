from flask import Flask,render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
import json
import os
import math


with open("config.json","r") as c:
    J=json.load(c)["J"]
app = Flask(__name__)

local_server=True
app.secret_key="Code learning"

if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI']=J["local_url"]
else:
    app.config['SQLALCHEMY_DATABASE_URI']=J["prod_url"]

db = SQLAlchemy(app)
#Python tutorial class
class Py_tut(db.Model):
    #py_tut :py_id,py_intro ,py_content
    py_id = db.Column(db.Integer,primary_key=True)
    slug = db.Column(db.String(21))
    py_intro = db.Column(db.String(500),nullable=False)
    py_content=db.Column(db.String(500),nullable=False)

class Contact(db.Model):
    c_id = db.Column(db.Integer,primary_key=True)
    name = db.Column(db.String(100),nullable=False)
    msg  = db.Column(db.String(200),nullable=False)
#all data fetch on home
@app.route('/')
def index():
    py_tut = Py_tut.query.filter_by().all()
    last = math.ceil(len(py_tut)/int(J['post_no']))
    page = request.args.get('page')
    if( not str(page).isnumeric()):
        page=1
    page = int(page)
    py_tut = py_tut[(page -1)*int(J['post_no']):(page -1)*int(J['post_no'])+int(J['post_no'])]

    #pagination

    if(page==1):
        prev='#'
        next = "/?page=" +str(page +1)

    #last
    elif(page == last):
        prev = '/?page=' +str(page -1)
        next="#"

    #mid
    else:
        prev = "/?page = " +str(page -1)
        next = "/?page = " +str(page +1)

    return render_template('index.html',J=J ,py_tut=py_tut ,next=next,prev=prev)

@app.route('/tutorial/<string:py_slug>',methods=['GET'])
def post(py_slug):
    py_tut = Py_tut.query.filter_by(slug=py_slug).first()
    return render_template('tutorial.html',J=J,py_tut=py_tut)



@app.route('/edit/<string:py_id>',methods=['GET','POST'])
def edit_post(py_id):
    if('user' in session and session['user'] == J['username']):
        if request.method == "POST":
            py_slug = request.form.get('slug')
            title = request.form.get('title')
            content = request.form.get('content')
            if py_id == "0":
                py_tut= Py_tut(slug=py_slug, py_intro=title,py_content=content)
                db.session.add(py_tut)
                db.session.commit()
                redirect("/dashboard")

            else:
                py_tut= Py_tut.query.filter_by(py_id=py_id).first()
                py_tut.slug = py_slug
                py_tut.py_intro = title
                py_tut.py_content = content
                db.session.commit()
                return redirect('/edit/' + py_id)
        py_tut = Py_tut.query.filter_by(py_id=py_id).first()
        return render_template("edit.html",J=J,py_id=py_id,py_tut=py_tut)

@app.route('/about')
def about_us():
    return render_template('about.html',J=J)


@app.route('/contact',methods=['GET','POST'])
def contact_us():
    if (request.method=="POST"):
        name1 = request.form.get('name')
        msg1 = request.form.get('msg')
        entry = Contact(name=name1,msg=msg1)
        db.session.add(entry)
        db.session.commit()

    return render_template('contact.html',J=J)



@app.route('/dashboard',methods=['GET','POST'])
def dashboard_page():
    if('user' in session and session['user']==J['username']):
        py_tut=Py_tut.query.all()
        return render_template('dashboard.html',J=J,py_tut=py_tut)
    if request.method == 'POST':
        username = request.form.get('uname')
        user_pwd = request.form.get('pword')
        if(username==J['username'] and user_pwd==J['password']):
            session['user'] = username
            py_tut = Py_tut.query.all()
            return render_template('dashboard.html',J=J,py_tut=py_tut)
    return  render_template('login.html',J=J)
#Delete Post
@app.route("/delete/<string:p_id>",methods=['GET','POST'])
def delete(p_id):
    if('user' in session and session['user']==J['username']):
        delete_post = Py_tut.query.filter_by(py_id=p_id).first()
        db.session.delete(delete_post)
        db.session.commit()
    return redirect("/dashboard")


@app.route("/logout")
def logout():
    session.pop("user")
    return redirect("/dashboard")


app.run(debug=True)