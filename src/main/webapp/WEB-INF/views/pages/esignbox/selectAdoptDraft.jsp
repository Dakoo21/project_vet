<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
    <head>
        <style>
            table {
                margin: 0 auto; /* 가운데 정렬을 위해 왼쪽과 오른쪽 마진을 자동으로 설정합니다. */
                width: 80%; /* 표의 너비를 조절할 수 있습니다. */
                border-collapse: collapse; /* 셀의 테두리를 합쳐서 보이도록 설정합니다. */
            }
            th, td {
                border: 1px solid black; /* 각 셀의 테두리를 설정합니다. */
                padding: 8px; /* 셀의 안쪽 여백을 설정합니다. */
                text-align: center; /* 셀 내의 텍스트를 가운데 정렬합니다. */
            }
        </style>
    </head>
    <body>
        <div id="content">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>신청자</th>
                    <th><input type="text" class="form-control" id="MASTER_NM" placeholder="" name="MASTER_NM" value="<%=signTotal.getMASTER_NAME()%>" readonly></th>
                </tr>
                <tr>
                    <th>동물이름</th>
                    <th><input type="text" class="form-control" id="ADOPT_NM" name="ADOPT_NM" value="<%=signTotal.getADOPT_NM()%>" readonly></th>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <th><input type="text" class="form-control" id="ADOPT_BDATE" name="ADOPT_BDATE" value="<%=signTotal.getADOPT_BDATE()%>" readonly></th>
                </tr>
                <tr>
                    <th>축종</th>
                    <th><input type="text" class="form-control" id="ADOPT_SPECIES" name="ADOPT_SPECIES" value="<%=signTotal.getADOPT_SPECIES()%>" readonly></th>
                </tr>
                <tr>
                    <th>품종</th>
                    <th><input type="text" class="form-control" id="ADOPT_BREED" placeholder="" name="ADOPT_BREED" value="<%=signTotal.getADOPT_BREED()%>" readonly></th>
                </tr>
                <tr>
                    <th>체중</th>
                    <th><input type="text" class="form-control" id="ADOPT_WEIGHT" name="ADOPT_WEIGHT" value="<%=signTotal.getADOPT_WEIGHT()%>" readonly></th>
                </tr>
                <tr>
                    <th>성별</th>
                    <th><input type="text" class="form-control" id="ADOPT_SEX" name="ADOPT_SEX" value="<%=signTotal.getADOPT_SEX()%>" readonly></th>
                </tr>
                <tr>
                    <th>중성화</th>
                    <th><input type="text" class="form-control" id="ADOPT_NEUT" name="ADOPT_NEUT" value="<%=signTotal.getADOPT_NEUT()%>" readonly></th>
                </tr>
                <tr>
                    <th>이유</th>
                    <th><input type="text" class="form-control" id="ADOPT_REASON" placeholder="" name="ADOPT_REASON" value="<%=signTotal.getADOPT_REASON()%>" readonly></th>
                </tr>
            </table>
        </div>
    </body>
</html>