import enum
from app import db, admin, dao
from sqlalchemy import Column, Integer, String, Float, ForeignKey, Boolean,DateTime, Date, DECIMAL, Time, Text, Enum
from sqlalchemy.orm import relationship
from flask_admin.contrib.sqla import ModelView
from flask_login import UserMixin, current_user, logout_user
from flask_admin import BaseView, expose
from flask import redirect


class AdminView(ModelView):
    column_display_pk = True

    def is_accessible(self):
        return current_user.is_authenticated and current_user.loaitaikhoan == LoaiTaiKhoan.ADMIN


class SanBay (db.Model):
    __table_args__ = {'extend_existing': True}
    masanbay = Column(Integer, primary_key=True, autoincrement=True)
    tensanbay = Column(String(50), nullable=False)
    diadiem = Column(String(50), nullable=False)
    sanbaycatcanh = relationship('LichChuyenBay', backref="sanbaycatcanh", lazy=True, foreign_keys='LichChuyenBay.masanbaycatcanh')
    sanbayhacanh = relationship('LichChuyenBay', backref="sanbayhacanh", lazy=True, foreign_keys='LichChuyenBay.masanbayhacanh')
    sanbaytrunggian = relationship('SanBayTrungGian', backref='sanbay', lazy=True)

    def __str__(self):
        return self.tensanbay

class NguoiDung (db.Model):
    __table_args__ = {'extend_existing': True}
    manguoidung = Column(Integer, primary_key=True, autoincrement=True)
    ten = Column(String(50), nullable=False)
    cmnd = Column(Integer, nullable=False)
    sdt = Column(String(10), nullable=False)
    email = Column(String(50), nullable=True)
    diachi = Column(String(50), nullable=False)
    gioitinh = Column(Boolean, default=True)
    vemaybay = relationship('VeMayBay', backref="nguoidung", lazy=True)
    taikhoan = relationship('TaiKhoan', backref='nguoidung', lazy=True)

    def __str__(self):
        return self.ten

class LichChuyenBay(db.Model):
    __table_args__ = {'extend_existing': True}
    machuyenbay = Column(Integer, primary_key=True, autoincrement=True)
    masanbaycatcanh = Column(Integer, ForeignKey(SanBay.masanbay), nullable=False)
    masanbayhacanh = Column(Integer, ForeignKey(SanBay.masanbay), nullable=False)
    ngaykhoihanh = Column(DateTime, nullable=False)
    thoigianbay = Column(Integer, nullable=False)
    soluongghehang1 = Column(Integer, nullable=False)
    soluongghehang2 = Column(Integer, nullable=False)
    sanbaytrunggian = relationship('SanBayTrungGian', backref='lichchuyenbay', lazy=True)
    giave = relationship('GiaVe', backref='lichchuyenbay', lazy=True)

    # def __str__(self):
    #     return self.sanbaycatcanh.tensanbay + " đến " + self.sanbayhacanh.tensanbay


class SanBayTrungGian (db.Model):
    __table_args__ = {'extend_existing': True}
    masanbay = Column(Integer, ForeignKey(SanBay.masanbay), primary_key=True)
    machuyenbay = Column(Integer, ForeignKey(LichChuyenBay.machuyenbay), primary_key=True)
    thoigiandung = Column(DateTime, nullable=False)

class LoaiVe (db.Model):
    __table_args__ = {'extend_existing': True}
    maloaive = Column(Integer, primary_key=True, autoincrement=True)
    tenloaive = Column(String(20), nullable=False)
    giave = relationship('GiaVe', backref='loaive', lazy=True)

    def __str__(self):
        return self.tenloaive

class GiaVe (db.Model):
    __table_args__ = {'extend_existing': True}
    machuyenbay = Column(Integer, ForeignKey(LichChuyenBay.machuyenbay), primary_key=True)
    maloaive = Column(Integer, ForeignKey(LoaiVe.maloaive), primary_key=True)
    giave = Column(DECIMAL(11, 2), nullable=False)

class TrangThaiVe(enum.Enum):
    DATHANHTOAN = 1
    DADAT = 2


class VeMayBay (db.Model):
    __table_args__ = {'extend_existing': True}
    mave = Column(Integer, primary_key=True, autoincrement=True)
    ngaykhoitao = Column(DateTime, nullable=False)
    trangthai = Column(Enum(TrangThaiVe), nullable=False)
    gia = Column(DECIMAL(11, 2), nullable=False)
    giamgia = Column(Float, default=0)
    maloaive = Column(Integer, ForeignKey(LoaiVe.maloaive), nullable=False)
    machuyenbay = Column(Integer, ForeignKey(LichChuyenBay.machuyenbay), nullable=False)
    manguoidung = Column(Integer, ForeignKey(NguoiDung.manguoidung), nullable=False)


class LoaiTaiKhoan(enum.Enum):
    ADMIN = 1
    NHANVIEN = 2


class TaiKhoan (db.Model, UserMixin):
    __table_args__ = {'extend_existing': True}
    id = Column(Integer, primary_key=True, autoincrement=True)
    tentaikhoan = Column(String(20), nullable=False)
    matkhau = Column(String(100), nullable=False)
    active = Column(Boolean, default=True)
    loaitaikhoan = Column(Enum(LoaiTaiKhoan), default=LoaiTaiKhoan.NHANVIEN)
    manguoidung = Column(Integer, ForeignKey(NguoiDung.manguoidung), nullable=False)

    def __str__(self):
        return self.tentaikhoan

# class ThemLichBay(BaseView):
#     @expose("/")
#     def index(self):
#         sanbay = dao.san_bay_read_all()
#         maybay = dao.may_bay_read_all()
#         chuyenbay = dao.chuyen_bay_read_all()
#         return self.render("admin/quan-ly-lich-bay.html", sanbay=sanbay, maybay=maybay, chuyenbay=chuyenbay)
#
#     def is_accessible(self):
#         return current_user.is_authenticated and current_user.loaitaikhoan == LoaiTaiKhoan.ADMIN

class LogoutView(BaseView):
    @expose("/")
    def index(self):
        logout_user()
        return redirect("/admin")
    def is_accessible(self):
        return current_user.is_authenticated

if __name__ == "__main__":
    db.create_all()