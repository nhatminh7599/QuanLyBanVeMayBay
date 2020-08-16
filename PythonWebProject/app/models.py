from app import db, admin
from sqlalchemy import Column, Integer, String, Float, ForeignKey, Boolean,DateTime, Date, DECIMAL, Time
from sqlalchemy.orm import relationship
from flask_admin.contrib.sqla import ModelView


class Hang (db.Model):
    mahang = Column(Integer, primary_key=True, autoincrement=True)
    tenhang = Column(String(50), nullable=False)
    lichbay = relationship('LichBay', backref="hang", lazy=True)
    maybay = relationship('MayBay', backref="hang", lazy=True)

    def __str__(self):
        return self.tenhang

class SanBay (db.Model):
    masanbay = Column(Integer, primary_key=True, autoincrement=True)
    tensanbay = Column(String(50), nullable=False)
    diadiem = Column(String(50), nullable=False)
    sanbaycatcanh = relationship('TuyenBay', backref="sanbaycatcanh", lazy=True, foreign_keys='TuyenBay.masanbaycatcanh')
    sanbayhacanh = relationship('TuyenBay', backref="sanbayhacanh", lazy=True, foreign_keys='TuyenBay.masanbaycatcanh')
    diadiemdi = relationship('LoTrinh', backref="diadiemdi", lazy=True, foreign_keys='LoTrinh.madiadiemdi')
    diadiemden = relationship('LoTrinh', backref="diadiemden", lazy=True, foreign_keys='LoTrinh.madiadiemden')

    def __str__(self):
        return self.tensanbay

class KhachHang (db.Model):
    makhachhang = Column(Integer, primary_key=True, autoincrement=True)
    ten = Column(String(50), nullable=False)
    cmnd = Column(Integer, nullable=False)
    sdt = Column(String(10), nullable=False)
    email = Column(String(50), nullable=True)
    diachi = Column(String(50), nullable=False)
    gioitinh = Column(Boolean, nullable=False)
    tendangnhap = Column(String(20), nullable=True)
    matkhau = Column(String(50), nullable=True)
    vemaybay = relationship('VeMayBay', backref="khachang", lazy=True)

    def __str__(self):
        return self.ten

class LoTrinh (db.Model):
    malotrinh = Column(Integer, primary_key=True, autoincrement=True)
    tenlotrinh = Column(String(50), nullable=False)
    madiadiemdi = Column(Integer, ForeignKey(SanBay.masanbay), nullable=False)
    madiadiemden = Column(Integer, ForeignKey(SanBay.masanbay), nullable=False)
    matuyenbay = relationship('TuyenBay', backref="lotrinh", lazy=True)

    def __str__(self):
        return self.tenlotrinh

class TuyenBay (db.Model):
    matuyenbay = Column(Integer, primary_key=True, autoincrement=True)
    malotrinh = Column(Integer, ForeignKey(LoTrinh.malotrinh), primary_key=True, nullable=False)
    giocatcanh = Column(Time, nullable=False)
    giohacanh = Column(Time, nullable=False)
    masanbaycatcanh = Column(Integer, ForeignKey(SanBay.masanbay), nullable=False)
    masanbayhacanh = Column(Integer, ForeignKey(SanBay.masanbay), nullable=False)
    lichbay = relationship('LichBay', backref="tuyenbay", lazy=True)
    chuyenbay = relationship('ChuyenBay', backref="tuyenbay", lazy=True)

    def __str__(self):
        return self.matuyenbay

class LichBay (db.Model):
    mahang = Column(Integer, ForeignKey(Hang.mahang), primary_key=True, nullable=False)
    matuyen = Column(Integer, ForeignKey(TuyenBay.matuyenbay), primary_key=True, nullable=False)
    ngaycohieuluc = Column(Date, nullable=False)
    ngayhethieuluc = Column(Date, nullable=False)

    def __str__(self):
        return self.mahang

class MayBay (db.Model):
    mamaybay = Column(Integer, primary_key=True, autoincrement=True)
    tenmaybay = Column(String(20), nullable=False)
    mahang = Column(Integer, ForeignKey(Hang.mahang), nullable=False)
    chuyenbay = relationship('ChuyenBay', backref="maybay", lazy=True)
    vemaybay = relationship('VeMayBay', backref="maybay", lazy=True)

    def __str__(self):
        return self.tenmaybay

class ChuyenBay (db.Model):
    machuyenbay = Column(Integer, primary_key=True, autoincrement=True)
    trangthai = Column(Boolean, default=False)
    mamaybay = Column(Integer, ForeignKey(MayBay.mamaybay), nullable=False)
    matuyen = Column(Integer, ForeignKey(TuyenBay.matuyenbay), nullable=False)
    sochongoi = relationship('SoChoNgoi', backref="chuyenbay", lazy=True)

    def __str__(self):
        return self.machuyenbay

class LoaiVe (db.Model):
    maloaive = Column(Integer, primary_key=True, autoincrement=True)
    tenloaive = Column(String(20), nullable=False)
    vemaybay = relationship('VeMayBay', backref="loaive", lazy=True)
    sochongoi = relationship('SoChoNgoi', backref="loaive", lazy=True)

    def __str__(self):
        return self.tenloaive

class VeMayBay (db.Model):
    mave = Column(Integer, primary_key=True, autoincrement=True)
    ngaykhoitao = Column(DateTime, nullable=False)
    maloaive = Column(Integer, ForeignKey(LoaiVe.maloaive), nullable=False)
    mamaybay = Column(Integer, ForeignKey(MayBay.mamaybay), nullable=False)
    makhachhang = Column(Integer, ForeignKey(KhachHang.makhachhang), nullable=False)
    lydohuy = Column(String(20), nullable=True)
    phihuy = Column(DECIMAL(11, 2), nullable=True)
    giamgia = Column(Float, default=0)

    def __str__(self):
        return self.mave

class SoChoNgoi (db.Model):
    machuyenbay = Column(Integer, ForeignKey(ChuyenBay.machuyenbay), primary_key=True, nullable=False)
    maloaive = Column(Integer, ForeignKey(LoaiVe.maloaive), primary_key=True, nullable=False)
    soluong = Column(Integer, nullable=False)
    giave = Column(DECIMAL(11, 2), nullable=False)

    def __str__(self):
        return self.soluong


admin.add_view(ModelView(Hang, db.session))
admin.add_view(ModelView(SanBay, db.session))
admin.add_view(ModelView(MayBay, db.session))
admin.add_view(ModelView(KhachHang, db.session))
admin.add_view(ModelView(LoTrinh, db.session))
admin.add_view(ModelView(TuyenBay, db.session))
admin.add_view(ModelView(LichBay, db.session))
admin.add_view(ModelView(ChuyenBay, db.session))
admin.add_view(ModelView(LoaiVe, db.session))
admin.add_view(ModelView(VeMayBay, db.session))
admin.add_view(ModelView(SoChoNgoi, db.session))



if __name__ == "__main__":
    db.create_all()