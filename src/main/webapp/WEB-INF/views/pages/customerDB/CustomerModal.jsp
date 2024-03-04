<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<script>
</script>
<!DOCTYPE html>
<html lang="ko">
<body>
<div class="modal" id="customerSearchForm" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">고객 검색</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <form id="f_totaldata">
                    <div class="form-floating mb-3 mt-3">
                        <table class="table table-borderless" id = "modal_searchForm">
                            <thead>
                            <tr>
                                <th>고객명</th>
                                <th>
                                    <div class="form-group row">
                                    <div class="col-7">${custInfo[0].master_nm}</div>
                                    </div>
                                </th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </form>
                <%--검색결과--%>
            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="Insert()"  value="확인">
            </div>
        </div>
    </div>
</div>
</body>
</html>



<style typeof="text/css">
    .form-group.row .col {
        margin-right: -80px;
    }

    .form-control{
        width: 50%;
        text-align: center;
        line-height: 2.5;
    }

    #exampleFormControlTextarea1{
        width: 100%;
    }

    #contents_box > #img_area{
        width: 50%;
        height: 50%;
    }
    #contents_box > #table table-borderless{
        width: 50%;
        height: 50%;
    }
    #contents_box > #img_area > img{
        width: 95%;
        padding-top: 50%;
    }
</style>