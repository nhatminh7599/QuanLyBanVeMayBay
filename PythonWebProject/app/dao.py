from app.models import *
import datetime


def read_san_bay():
    data = []
    sanbay = SanBay.query.all()
    for san in sanbay:
        data.append({
            'masanbay': san.masanbay,
            'tensanbay': san.tensanbay,
            'diadiem': san.diadiem
        })
    return data


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
                'soghedadat': ve.soghedat,
                'giave': str(ve.giave)
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


def read_lich_chuyen_bay_form(diemdi, diemden, ngaykhoihanh, loaive):
    data = []
    soghetrong = []
    machuyenbay = []
    giave = GiaVe.query.filter(GiaVe.maloaive == int(loaive)).all()
    for ve in giave:
        machuyenbay.append(ve.machuyenbay)
    sanbaydi = SanBay.query.get(int(diemdi))
    sanbayden = SanBay.query.get(int(diemden))
    lichbay = LichChuyenBay.query.filter(LichChuyenBay.masanbaycatcanh == sanbaydi.masanbay,
                                         LichChuyenBay.masanbayhacanh == sanbayden.masanbay,
                                         LichChuyenBay.ngaykhoihanh >= datetime.datetime.strptime(ngaykhoihanh, '%Y-%m-%d'),
                                         LichChuyenBay.machuyenbay.in_(machuyenbay)).all()
    for lich in lichbay:
        san = []
        giave = GiaVe.query.filter(GiaVe.machuyenbay == lich.machuyenbay, GiaVe.maloaive == int(loaive)).all()
        for ve in giave:
            soghetrong.append({
                'maloaive': ve.maloaive,
                'loaive': ve.loaive.tenloaive,
                'soghetrong': ve.soghetrong,
                'soghedadat': ve.soghedat,
                'giave': str(ve.giave)
            })
        sanbaytrunggian = SanBayTrungGian.query
        sanbaytrunggian = sanbaytrunggian.filter(SanBayTrungGian.machuyenbay == lich.machuyenbay).all()
        if sanbaytrunggian:
            for idx, sanbay in enumerate(sanbaytrunggian):
                san.append({
                    'sanbaytrunggian' + str(idx + 1): sanbay.sanbaytrunggian.__str__()
                })
        data.append({
            'machuyenbay': lich.machuyenbay,
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


def read_lich_chuyen_bay_theo_ma_chuyen_ma_loai_ve(machuyenbay, maloaive):
    sanbay = []
    giave = GiaVe.query.get([int(machuyenbay), int(maloaive)])

    sanbaytrunggian = SanBayTrungGian.query
    sanbaytrunggian = sanbaytrunggian.filter(SanBayTrungGian.machuyenbay == machuyenbay).all()
    if sanbaytrunggian:
        for idx, san in enumerate(sanbaytrunggian):
            sanbay.append({
                'thutu': idx + 1,
                'diadiemdung': san.sanbaytrunggian.diadiem,
                'thoigiandung': san.thoigiandung
            })

    lichchuyenbay = LichChuyenBay.query.get(machuyenbay)
    data = {
        'machuyenbay': lichchuyenbay.machuyenbay,
        'diadiemdi': lichchuyenbay.sanbaycatcanh.diadiem,
        'diadiemden': lichchuyenbay.sanbayhacanh.diadiem,
        'sanbaycatcanh': lichchuyenbay.sanbaycatcanh.__str__(),
        'sanbayhacanh': lichchuyenbay.sanbayhacanh.__str__(),
        'ngaykhoihanh': lichchuyenbay.ngaykhoihanh.strftime('%d-%m-%Y'),
        'giokhoihanh': lichchuyenbay.ngaykhoihanh.strftime('%H:%M'),
        'thoigianbay': lichchuyenbay.thoigianbay,
        'maloaive': giave.maloaive,
        'loaive': giave.loaive.tenloaive,
        'giave': str(giave.giave),
        'sodiemdung': len(sanbay),
        'sanbaytrunggian': sanbay
    }

    return data



def read_loai_ve():
    data = []
    loaive = LoaiVe.query.all()
    for loai in loaive:
        data.append({
            'maloaive': loai.maloaive,
            'loaive': loai.tenloaive
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


def tim_khach_hang(keyword):
    data = []
    khach_hang = KhachHang.query
    khach_hang = khach_hang.filter((KhachHang.cmnd == int(keyword)) | (KhachHang.sdt == keyword)).all()
    for khach in khach_hang:
        ve_may_bay = VeMayBay.query.filter(VeMayBay.makhachhang == khach.makhachhang).all()
        ve = []
        for vemaybay in ve_may_bay:
            ve.append({
                'ma_ve': vemaybay.mave,
                'tenchuyenbay': vemaybay.lichchuyenbay.__str__(),
                'loaive': vemaybay.loaive.tenloaive,
                'giave': str(vemaybay.gia),
                'trangthai': vemaybay.trangthai
            })
        data.append({
            'makhachhang': khach.makhachhang,
            'ten': khach.ten,
            'cmnd': khach.cmnd,
            'sdt': khach.sdt,
            'email': khach.email,
            'gioitinh': khach.gioitinh,
            'vemaybay': ve
        })
    return data


def tim_khach_hang_id(ma_khach_hang, ma_ve):
    khach_hang = KhachHang.query.get(ma_khach_hang)
    ve = VeMayBay.query.get(ma_ve)
    data = {
        'makhachhang': khach_hang.makhachhang,
        'ten': khach_hang.ten,
        'cmnd': khach_hang.cmnd,
        'sdt': khach_hang.sdt,
        'email': khach_hang.email,
        'tenchuyenbay': ve.lichchuyenbay.__str__(),
        'loaive': ve.loaive.tenloaive,
        'giave': str(ve.gia),
        'thoigianbay': str(ve.lichchuyenbay.thoigianbay)

    }
    return data


def sua_khach_hang(ma_khach_hang, ten_khach_hang, cmnd, sdt, email):
    try:
        khach_hang = KhachHang.query.get(int(ma_khach_hang))
        khach_hang.ten = ten_khach_hang
        khach_hang.cmnd = int(cmnd)
        khach_hang.sdt = sdt
        khach_hang.email = email
        db.session.add(khach_hang)
        db.session.commit()
        return True
    except:
        return False


def them_khach_hang(ten_khach_hang, cmnd, sdt, email, gioi_tinh):
    khach_hang = KhachHang(ten=ten_khach_hang, cmnd=cmnd, sdt=sdt, email=email, gioitinh=gioi_tinh)
    db.session.add(khach_hang)
    db.session.commit()
    return khach_hang.makhachhang


def them_ve(trang_thai, gia, ma_loai_ve, ma_chuyen_bay, ma_khach_hang, giam_gia=0):
    try:
        gia_ve = GiaVe.query.get([int(ma_chuyen_bay), int(ma_loai_ve)])
        if gia_ve.soghetrong > 0:
            ve = VeMayBay(trangthai=int(trang_thai), gia=int(gia), giamgia=0, maloaive=int(ma_loai_ve),
                          machuyenbay=int(ma_chuyen_bay), makhachhang=int(ma_khach_hang),
                          ngaykhoitao=datetime.datetime.utcnow().strftime('%Y-%m-%d'))
            db.session.add(ve)
            db.session.commit()
            gia_ve.soghetrong = gia_ve.soghetrong - 1
            gia_ve.soghedat = gia_ve.soghedat + 1
            db.session.add(gia_ve)
            db.session.commit()
            return True
        else:
            return False
    except Exception:
        return False


def xoa_ve(ma_ve):
    try:
        ve = VeMayBay.query.get(int(ma_ve))
        db.session.delete(ve)
        db.session.commit()
        return True
    except:
        return False


def sua_trang_thai_ve(ma_ve):

    ve = VeMayBay.query.get(int(ma_ve))
    try:
        ve.trangthai = int(1)
        db.session.add(ve)
        db.session.commit()
        return True
    except:
        return False