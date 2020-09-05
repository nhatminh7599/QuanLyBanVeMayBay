from app.models import *
import datetime


def read_lich_chuyen_bay():
    data = []
    machuyen = []
    for ve in GiaVe.query.filter(GiaVe.soghetrong > 0).all():
        if ve.machuyenbay not in machuyen:
            machuyen.append(ve.machuyenbay)
    lichbay = LichChuyenBay.query.filter(LichChuyenBay.machuyenbay.in_(machuyen), LichChuyenBay.ngaykhoihanh > datetime.datetime.now()).all()
    for lich in lichbay:
        san = []
        soghetrong = []
        giave = GiaVe.query.filter(GiaVe.machuyenbay == lich.machuyenbay, GiaVe.soghetrong > 0).all()
        for ve in giave:
            soghetrong.append({
                'loaive': ve.loaive.tenloaive,
                'soghetrong': ve.soghetrong,
                'soghedadat': ve.soghedat
            })
        sanbaytrunggian = SanBayTrungGian.query
        sanbaytrunggian = sanbaytrunggian.filter(SanBayTrungGian.machuyenbay == lich.machuyenbay).all()
        if sanbaytrunggian:
            for idx, sanbay in enumerate(sanbaytrunggian):
                san.append({
                    'sanbaytrunggian' + str(idx + 1): sanbay.sanbaytrunggian.__str__()
                })
        data.append({
            'tenchuyenbay': lich.__str__(),
            'sanbaycatcanh': lich.sanbaycatcanh.__str__(),
            'sanbayhacanh': lich.sanbayhacanh.__str__(),
            'ngaykhoihanh': str(lich.ngaykhoihanh),
            'thoigianbay': lich.thoigianbay,
            'soluongghehang1': lich.soluongghehang1,
            'soluongghehang2': lich.soluongghehang2,
            'sanbaytrunggian': san,
            'soghetrong': soghetrong
        })
    return data


def read_lich_chuyen_bay_id(machuyenbay):
    lich = LichChuyenBay.query.get(machuyenbay)
    san = []
    soghetrong = []
    giave = GiaVe.query.filter(GiaVe.machuyenbay == lich.machuyenbay, GiaVe.soghetrong > 0).all()
    for ve in giave:
        soghetrong.append({
            'loaive': ve.loaive.tenloaive,
            'soghetrong': ve.soghetrong,
            'soghedadat': ve.soghedat
        })
    sanbaytrunggian = SanBayTrungGian.query
    sanbaytrunggian = sanbaytrunggian.filter(SanBayTrungGian.machuyenbay == lich.machuyenbay).all()
    if sanbaytrunggian:
        for idx, sanbay in enumerate(sanbaytrunggian):
            san.append({
                'sanbaytrunggian' + str(idx + 1): sanbay.sanbaytrunggian.__str__()
            })
    data = {
        'tenchuyenbay': lich.__str__(),
        'sanbaycatcanh': lich.sanbaycatcanh.__str__(),
        'sanbayhacanh': lich.sanbayhacanh.__str__(),
        'ngaykhoihanh': str(lich.ngaykhoihanh),
        'thoigianbay': lich.thoigianbay,
        'soluongghehang1': lich.soluongghehang1,
        'soluongghehang2': lich.soluongghehang2,
        'sanbaytrunggian': san,
        'soghetrong': soghetrong
    }
    return data


def read_lich_chuyen_bay_san_bay(diemdi, diemden):
    data = []
    soghetrong = []
    sanbaydi = SanBay.query.filter(SanBay.tensanbay.contains(diemdi)).all()
    sanbayden = SanBay.query.filter(SanBay.tensanbay.contains(diemden)).all()
    lichbay = LichChuyenBay.query.filter(LichChuyenBay.masanbaycatcanh == sanbaydi[0].masanbay,
                                         LichChuyenBay.masanbayhacanh == sanbayden[0].masanbay).all()
    for lich in lichbay:
        san = []
        giave = GiaVe.query.filter(GiaVe.machuyenbay == lich.machuyenbay).all()
        for ve in giave:
            soghetrong.append({
                'loaive': ve.loaive.tenloaive,
                'soghetrong': ve.soghetrong,
                'soghedadat': ve.soghedat
            })
        sanbaytrunggian = SanBayTrungGian.query
        sanbaytrunggian = sanbaytrunggian.filter(SanBayTrungGian.machuyenbay == lich.machuyenbay).all()
        if sanbaytrunggian:
            for idx, sanbay in enumerate(sanbaytrunggian):
                san.append({
                    'sanbaytrunggian' + str(idx + 1): sanbay.sanbaytrunggian.__str__()
                })
        data.append({
            'tenchuyenbay': lich.__str__(),
            'sanbaycatcanh': lich.sanbaycatcanh.__str__(),
            'sanbayhacanh': lich.sanbayhacanh.__str__(),
            'ngaykhoihanh': str(lich.ngaykhoihanh),
            'thoigianbay': lich.thoigianbay,
            'soluongghehang1': lich.soluongghehang1,
            'soluongghehang2': lich.soluongghehang2,
            'sanbaytrunggian': san,
            'soghetrong': soghetrong
        })
    return data


def read_lich_chuyen_bay_form(diemdi, diemden, ngaykhoihanh):
    data = []
    soghetrong = []
    sanbaydi = SanBay.query.filter(SanBay.tensanbay.contains(diemdi)).all()
    sanbayden = SanBay.query.filter(SanBay.tensanbay.contains(diemden)).all()
    lichbay = LichChuyenBay.query.filter(LichChuyenBay.masanbaycatcanh == sanbaydi[0].masanbay,
                                         LichChuyenBay.masanbayhacanh == sanbayden[0].masanbay,
                                         LichChuyenBay.ngaykhoihanh == datetime.datetime.strptime(ngaykhoihanh,
                                                                                                  '%Y-%m-%d %H:%M:%S')).all()
    for lich in lichbay:
        san = []
        giave = GiaVe.query.filter(GiaVe.machuyenbay == lich.machuyenbay).all()
        for ve in giave:
            soghetrong.append({
                'loaive': ve.loaive.tenloaive,
                'soghetrong': ve.soghetrong,
                'soghedadat': ve.soghedat
            })
        sanbaytrunggian = SanBayTrungGian.query
        sanbaytrunggian = sanbaytrunggian.filter(SanBayTrungGian.machuyenbay == lich.machuyenbay).all()
        if sanbaytrunggian:
            for idx, sanbay in enumerate(sanbaytrunggian):
                san.append({
                    'sanbaytrunggian' + str(idx + 1): sanbay.sanbaytrunggian.__str__()
                })
        data.append({
            'tenchuyenbay': lich.__str__(),
            'sanbaycatcanh': lich.sanbaycatcanh.__str__(),
            'sanbayhacanh': lich.sanbayhacanh.__str__(),
            'ngaykhoihanh': str(lich.ngaykhoihanh),
            'thoigianbay': lich.thoigianbay,
            'soluongghehang1': lich.soluongghehang1,
            'soluongghehang2': lich.soluongghehang2,
            'sanbaytrunggian': san,
            'soghetrong': soghetrong
        })
    return data


def read_loai_ve():
    data = []
    ve = GiaVe.query.all()
    for v in ve:
        data.append({
            'tenchuyenbay': v.lichchuyenbay.__str__(),
            'loaive': v.loaive.__str__(),
            'giave': str(v.giave)
        })
    return data


def read_loai_ve_theo_chuyen(ma_chuyen):
    data = []
    ve = GiaVe.query
    ve = ve.filter(GiaVe.machuyenbay == ma_chuyen).all()
    for v in ve:
        data.append({
            'tenchuyenbay': v.lichchuyenbay.__str__(),
            'loaive': v.loaive.__str__(),
            'giave': str(v.giave)
        })
    return data


def read_khach_hang(keyword=None):
    khach_hang = KhachHang.query
    if keyword:
        data = {}
        khach_hang = khach_hang.filter((KhachHang.cmnd == int(keyword)) | (KhachHang.sdt == keyword)).all()
        if khach_hang:
            data = {
                'makhachhang': khach_hang[0].makhachhang,
                'ten': khach_hang[0].ten,
                'cmnd': khach_hang[0].cmnd,
                'sdt': khach_hang[0].sdt,
                'email': khach_hang[0].email,
                'gioitinh': khach_hang[0].gioitinh.__str__()
            }
        return data
    data = []
    khach_hang.all()
    for khach in khach_hang:
        data.append({
            'makhachhang': khach.makhachhang,
            'ten': khach.ten,
            'cmnd': khach.cmnd,
            'sdt': khach.sdt,
            'email': khach.email,
            'gioitinh': khach.gioitinh.__str__()
        })
    return data


def sua_khach_hang(ma_khach_hang, ten_khach_hang, cmnd, sdt, email, gioi_tinh):
    try:
        khach_hang = KhachHang.query.get(ma_khach_hang)
        khach_hang.tenkhachhang = ten_khach_hang
        khach_hang.cmnd = cmnd
        khach_hang.sdt = sdt
        khach_hang.email = email
        khach_hang.gioitinh = gioi_tinh
        db.session.add(khach_hang)
        db.session.commit()
        return True
    except:
        return False



def them_ve(trang_thai, gia, giam_gia, ma_loai_ve, ma_chuyen_bay, ma_khach_hang):
    try:
        ve = VeMayBay(trangthai=trang_thai, gia=gia, giamgia=giam_gia, maloaive=ma_loai_ve, machuyenbay=ma_chuyen_bay, makhachhang=ma_khach_hang)
        db.session.add(ve)
        db.session.commit()
        gia_ve = GiaVe.query.get([ve.machuyenbay, ve.maloaive])
        gia_ve.soghetrong = gia_ve.soghetrong - 1
        gia_ve.soghedat = gia_ve.soghedat + 1
        db.session.add(gia_ve)
        db.session.commit()
        return True
    except:
        return False


def xoa_ve(ma_ve):
    try:
        ve = VeMayBay.query.get(ma_ve)
        db.session.delete(ve)
        db.session.commit()
        return True
    except:
        return False


def sua_ve(ma_ve, gia, giam_gia, ma_loai_ve):
    ve = VeMayBay.query.get(ma_ve)
    try:
        ve.gia = gia
        ve.giamgia = giam_gia
        ve.maloaive = ma_loai_ve
        db.session.add(ve)
        db.session.commit()
        return True
    except:
        return False