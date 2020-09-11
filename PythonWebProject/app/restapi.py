from app import app, dao
from flask import jsonify, request


@app.route("/api/san-bay", methods=['get'])
def san_bay():
    data = dao.read_san_bay()
    return jsonify(
        message="success",
        data=data,
        status=200
    )


@app.route("/api/lich-chuyen-bay", methods=['get', 'post'])
def lich_chuyen_bay():
    try:
    # if request.json["diemdi"] and request.json["diemden"] \
    #         and request.json["ngaykhoihanh"] and request.json["loaive"]:
        diemdi = request.json["diemdi"]
        diemden = request.json["diemden"]
        ngaykhoihanh = request.json["ngaykhoihanh"]
        loaive = request.json["loaive"]
        data = dao.read_lich_chuyen_bay_form(diemdi, diemden, ngaykhoihanh, loaive)
    # else:
    except Exception:
        data = dao.read_lich_chuyen_bay()
    return jsonify(
        message="success",
        data=data,
        status=200
    )


@app.route("/api/read-lich-chuyen-bay-theo-ma-chuyen-ma-loai-ve", methods=['get', 'post'])
def read_lich_chuyen_bay_theo_ma_chuyen_ma_loai_ve():
    machuyenbay = request.json["machuyenbay"]
    maloaive = request.json["maloaive"]
    data = dao.read_lich_chuyen_bay_theo_ma_chuyen_ma_loai_ve(machuyenbay, maloaive)
    return jsonify(
        message="success",
        data=data,
        status=200
    )


@app.route("/api/lich-chuyen-bay/<int:machuyen>", methods=['get', 'post'])
def lich_chuyen_bay_id(machuyen):
    data = dao.read_lich_chuyen_bay_id(machuyen)
    return jsonify(
        message="success",
        data=data,
        status=200
    )


@app.route("/api/loai-ve")
def gia_ve():
    data = dao.read_loai_ve()
    return jsonify(
        message="success",
        data=data,
        status=200
    )


@app.route("/api/loai-ve/<int:ma_chuyen>")
def gia_ve_theo_chuyen(ma_chuyen):
    data = dao.read_loai_ve_theo_chuyen(ma_chuyen)
    return jsonify(
        message="success",
        data=data,
        status=200
    )


@app.route("/api/khach-hang", methods=['get', 'post'])
def khach_hang():
    keyword = request.json["kw"] if request.json["kw"] else None
    data = dao.tim_khach_hang(keyword=keyword)
    return jsonify(
        message="success",
        data=data,
        status=200
    )


@app.route("/api/them-ve", methods=['post', 'get'])
def them_ve():
    try:
        trang_thai = int(request.json['trang_thai'])
        gia = int(request.json['gia'])
        giam_gia = 0
        ma_loai_ve = int(request.json['ma_loai_ve'])
        ma_chuyen_bay = int(request.json['ma_chuyen_bay'])
        ten_khach_hang = request.json['ten_khach_hang']
        cmnd = int(request.json['cmnd'])
        sdt = request.json['sdt']
        email = request.json['email']
        gioi_tinh = request.json['gioi_tinh']

        ma_khach_hang = dao.them_khach_hang(ten_khach_hang=ten_khach_hang, cmnd=cmnd, sdt=sdt, email=email, gioi_tinh=gioi_tinh)
        if dao.them_ve(trang_thai=int(trang_thai), gia=gia, giam_gia=0, ma_loai_ve=ma_loai_ve,
                       ma_chuyen_bay=ma_chuyen_bay, ma_khach_hang=ma_khach_hang):
            return jsonify(
                message="success",
                status=200
            )
        return jsonify(
            message="Them ve that bai",
            status=400
        )
    except Exception:
        return jsonify(
            message="fail",
            status=400
        )


@app.route("/api/del-ve", methods=['delete'])
def xoa_ve():
    ma_ve = request.json["mave"]
    if dao.xoa_ve(ma_ve):
        return jsonify(
            message="success",
            status=200
        )
    return jsonify(
        message="fail",
        status=400
    )


@app.route("/api/sua-trang-thai-ve", methods=['post', 'get'])
def sua_trang_thai_ve():
    ma_ve = request.json['mave']
    if dao.sua_trang_thai_ve(ma_ve):
        return jsonify(
            message="success",
            status=200
        )
    return jsonify(
        message="fail",
        status=400
    )


@app.route("/api/sua-khach-hang", methods=['post', 'get'])
def sua_khach_hang():
    ma_khach_hang = request.json['makhachhang']
    ten_khach_hang = request.json['tenkhachhang']
    cmnd = request.json['cmnd']
    sdt = request.json['sdt']
    email = request.json['email']
    if dao.sua_khach_hang(ma_khach_hang, ten_khach_hang, cmnd, sdt, email):
        return jsonify(
            message="success",
            status=200
        )
    return jsonify(
        message="fail",
        status=400
    )


@app.route("/api/chi-tiet-ve", methods=['post', 'get'])
def chi_tiet_ve():
    ma_khach_hang = request.json['makhachhang']
    ma_ve = request.json['mave']
    if dao.tim_khach_hang_id(ma_khach_hang, ma_ve):
        return jsonify(
            message="success",
            data=dao.tim_khach_hang_id(ma_khach_hang, ma_ve),
            status=200
        )
    return jsonify(
        message="fail",
        status=400
    )
