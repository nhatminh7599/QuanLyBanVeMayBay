from app import app, dao
from flask import jsonify

@app.route("/api/lich-chuyen-bay", methods=['get'])
def lich_chuyen_bay():
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

@app.route("/api/gia-ve")
def giave():
    data = dao.read_gia_ve()
    return jsonify(
                message="success",
                data=data,
                status=200
    )