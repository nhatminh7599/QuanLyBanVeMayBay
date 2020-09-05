from app import app, dao
from flask import jsonify, request


@app.route("/api/lich-chuyen-bay", methods=['get', 'post'])
def lich_chuyen_bay():
    if request.args.get("diemdi") and request.args.get("diemden") and request.args.get("ngaykhoihanh"):
        diemdi = request.form.get("diemdi")
        diemden = request.form.get("diemden")
        ngaykhoihanh = request.args.get("ngaykhoihanh")
        data = dao.read_lich_chuyen_bay_form(diemdi, diemden, ngaykhoihanh)
    else:
        if request.args.get("diemdi") and request.args.get("diemden"):
            diemdi = request.form.get("diemdi")
            diemden = request.form.get("diemden")
            data = dao.read_lich_chuyen_bay_san_bay(diemdi, diemden)
        else:
            data = dao.read_lich_chuyen_bay()
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


@app.route("/api/khach-hang")
def khach_hang():
    keyword = request.args["keyword"] if request.args.get("keyword") else None
    data = dao.read_khach_hang(keyword=keyword)
    return jsonify(
        message="success",
        data=data,
        status=200
    )


@app.route("/api/them-ve", methods=['post', 'get'])
def them_ve():
    trang_thai = request.args.get('trangthai')
    ma_ve = request.args.get('mave')
    gia = request.args.get('gia')
    giam_gia = request.args.get('giamgia')
    ma_loai_ve = request.args.get('maloaive')
    ma_chuyen_bay = request.args.get('machuyenbay')
    ma_khach_hang = request.args.get('makhachhang')
    if dao.them_ve(trang_thai, gia, giam_gia, ma_loai_ve, ma_chuyen_bay, ma_khach_hang):
        return jsonify(
            message="success",
            status=200
        )
    return jsonify(
        message="fail",
        status=400
    )


@app.route("/api/del-ve", methods=['delete'])
def xoa_ve():
    ma_ve = request.form.get("mave")
    if dao.delete_ve(ma_ve):
        return jsonify(
            message="success",
            status=200
        )
    return jsonify(
        message="fail",
        status=400
    )


@app.route("/api/sua-ve", methods=['post', 'get'])
def sua_ve():
    ma_ve = request.args.get('mave')
    gia = request.args.get('gia')
    giam_gia = request.args.get('giamgia')
    ma_loai_ve = request.args.get('maloaive')
    if dao.sua_ve(ma_ve, gia, giam_gia, ma_loai_ve):
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
    ma_khach_hang = request.args.get('makhachhang')
    ten_khach_hang = request.args.get('tenkhachhang')
    cmnd = request.args.get('cmnd')
    sdt = request.args.get('sdt')
    email = request.args.get('email')
    gioi_tinh = request.args.get('gioitinh')
    if dao.sua_khach_hang(ma_khach_hang, ten_khach_hang, cmnd, sdt, email, gioi_tinh):
        return jsonify(
            message="success",
            status=200
        )
    return jsonify(
        message="fail",
        status=400
    )
