import json

from app import app, login, dao, restapi
from app.admin import *
from flask import render_template, redirect, request, url_for, session, jsonify
from flask_login import login_user
import hashlib

@app.route("/")
def index():
    lich = dao.read_lich_chuyen_bay()
    return render_template("index.html", lich=lich)

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




if __name__ == "__main__":
    app.run(debug=True)