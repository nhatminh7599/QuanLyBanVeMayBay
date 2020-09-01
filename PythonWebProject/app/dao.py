import datetime

from app.models import *
from app import db
import json

def read_lich_chuyen_bay():
    data = []
    lichbay = LichChuyenBay.query.all()
    for lich in lichbay:
        data.append({
            'chuyenbay': lich.__str__(),
            'masanbaycatcanh': lich.sanbaycatcanh.__str__(),
            'masanbayhacanh': lich.sanbayhacanh.__str__(),
            'ngaykhoihanh': str(lich.ngaykhoihanh),
            'thoigianbay': lich.thoigianbay,
            'soluongghehang1': lich.soluongghehang1,
            'soluongghehang2': lich.soluongghehang2
        })
    return data


def read_lich_chuyen_bay_id(machuyenbay):
    lich = LichChuyenBay.query.get(machuyenbay)
    data = {
        'machuyenbay': lich.machuyenbay,
        'masanbaycatcanh': lich.masanbaycatcanh,
        'masanbayhacanh': lich.masanbayhacanh,
        'ngaykhoihanh': str(lich.ngaykhoihanh),
        'thoigianbay': lich.thoigianbay,
        'soluongghehang1': lich.soluongghehang1,
        'soluongghehang2': lich.soluongghehang2
    }
    return data

def read_gia_ve():
    data = []
    ve = GiaVe.query.all()
    for v in ve:
        data.append({
            'chuyenbay': v.lichchuyenbay.__str__(),
            'loaive': v.loaive.__str__(),
            'giave': str(v.giave)
        })
    return data