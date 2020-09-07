
from app import app, login, dao, restapi
from app.admin import *
from flask import render_template, redirect, request, session
from flask_login import login_user
import hashlib


@app.route("/")
def index():
    sanbay = dao.read_san_bay()
    loaive = dao.read_loai_ve()
    return render_template("nhanvien/index.html", sanbay=sanbay, loaive=loaive)


@login.user_loader
def user_loader(user_id):
    return TaiKhoan.query.get(user_id)


@app.route("/login-admin", methods=['GET', 'POST'])
def login_admin():
    if request.method == 'POST':
        tentaikhoan = request.form.get("tentaikhoan")
        matkhau = request.form.get("matkhau")
        matkhau = str(hashlib.md5(matkhau.strip().encode("utf-8")).hexdigest())
        taikhoan = TaiKhoan.query.filter(TaiKhoan.tentaikhoan == tentaikhoan.strip(), TaiKhoan.matkhau == matkhau, TaiKhoan.loaitaikhoan == LoaiTaiKhoan.ADMIN).first()
        if taikhoan:
            login_user(user=taikhoan)
        else:
            err = "Truy cập thất bại"
            session['err-login'] = err
        return redirect('/admin')

@app.route("/ticket-detail", methods=['get', 'post'] )
def ticket_detail():
    return render_template("ticket-detail.html")

@app.route("/ticket-list", methods=['get', 'post'] )
def ticket_list():
    return render_template("nhanvien/ticket-list.html")

@app.route("/ticket-fill-form", methods=['get', 'post'] )
def ticket_fill_form():
    return render_template("ticket-fill-form.html")

@app.route("/ticket-info", methods=['get', 'post'] )
def ticket_info():
    return render_template("ticket-info.html")

@app.route("/ticket-manager", methods=['get', 'post'] )
def ticket_manager():
    return render_template("ticket-manager.html")

@app.route("/nhanvien/flight-manager", methods=['get', 'post'] )
def flight_manager():
    return render_template("nhanvien/flight-manager.html")

@app.route("/login", methods=['get', 'post'] )
def login():
    return render_template("login.html")


if __name__ == "__main__":
    app.run(debug=True)