<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>

<div class="content_wrap">
        <div class="wrap clearfix">
            <div class="lnb type03 borderNone clearfix">
        <strong class="myName"><span>지수진</span>님</strong>
        <span class="division"> 일반회원 </span>
    <span class="email">sun02036@naver.com</span>
    <a href="#" class="btn btn-xxs btn-color-type02 btn-radius btn-line goToMyInfo">내 정보</a>
    <div class="boxArea">
        <dl class="reservation">
            <dt>예약</dt>
            <dd>
                <a href="#">0</a>
            </dd>
        </dl>
        <dl class="coupon">
            <dt>쿠폰</dt>
            <dd>
                <a href="https://www.rentking.co.kr/myPage/Coupon">9</a>
            </dd>
        </dl>
    </div>
    <hr class="memTypeDivider">
    <ul class="menuList">
        <li class=""><a href="https://www.rentking.co.kr/myPage/Reservation">예약내역</a></li>
        <li class=""><a href="https://www.rentking.co.kr/myPage/Coupon">쿠폰함 / 쿠폰등록</a></li>
        <li class="active"><a href="https://www.rentking.co.kr/myPage/myInfo">내 정보</a></li>
        <li>
            <a id="kakao-link-btn" href="javascript:sendLink()">
                친구 초대
            </a>
        </li>

        <li>
                <a id="kakao-link-btn" href="https://www.rentking.co.kr/myPage/Reservation/13">
                리뷰 쓰기
                </a>
        </li>

    
    </ul>
    <div class="bannerArea">
        
    </div>
    
    <script>

    function sendLink(){
        Kakao.Link.sendDefault({
            objectType: 'feed',
            content: {
                title: '렌트킹',
                description: '국내 최고의 렌터카 실시간 가격 비교 예약',
                imageUrl:
                'https://www.rentking.co.kr/resources/assets/src/imgs/rentking.w/bg/main2_2020_09_08.jpg',
                link: {
                mobileWebUrl: 'https://m.rentking.co.kr',
                androidExecParams: 'test',
                },
            },
            serverCallbackArgs: { 
                 member_idx: '80765'
            },
            buttons: [
                {
                    title: '웹으로 이동',
                    link: {
                        mobileWebUrl: 'https://m.rentking.co.kr',
                    },
                },
                {
                    title: '앱으로 이동',
                    link: {
                        mobileWebUrl: 'https://m.rentking.co.kr/appDownload'
                    },
                }
            ]
            });
    }
    
    </script>
    
</div>
            <div class="mypageCont">
                <strong class="tit01">내 정보</strong>
                <div class="mypageDesc2">
                    <div class="topArea clearfix">
                        <strong class="tit04 clearfix">
                            기본정보
                            
                        </strong>
                    </div>
                                        <dl>
                        <dt>이름</dt>
                        <dd>지수진</dd>
                    </dl>
                    <dl>
                        <dt>이메일</dt>
                        <dd>sun02036@naver.com</dd>
                    </dl>
                    <dl>
                        <dt>생년월일</dt>
                        <dd>1995-09-22</dd>
                    </dl>
                    <dl>
                        <dt>비밀번호</dt>
                        <dd>
                            <span class="input-text-outer-wrap is-login-text have-right-section">
                                <span class="is-text-inner-wrap is-login-text">
                                    <input type="password" data-text-module="" readonly="">
                                </span>
                                <span class="input-text-outer-wrap__right-section">
                                    <a href="javascript:;" class="btn-pwd-pop">변경</a>
                                </span>
                            </span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>휴대폰번호</dt>
                        <dd>
                            <form name="frmCpModify" id="frmCpModify" method="post">
                                <input type="hidden" name="_token" value="KUIlaf6wzIPUNwYBCLiUCeU6b3f4PE3MxFgJp2O0">
                                <span class="input-text-outer-wrap is-login-text have-right-section">
                                    <span class="is-text-inner-wrap is-login-text">
                                        <input type="text" name="cp" id="cp" value="01089604543" data-text-module="" readonly="">
                                    </span>
                                    <span class="input-text-outer-wrap__right-section">
                                        <a href="javascript:;" class="btn-cp-modify">변경</a>
                                    </span>
                                </span>
                            </form>
                        </dd>
                    </dl>
                    <dl>
                        <dt>마케팅 수신</dt>
                        <dd>
                            <form name="frmPush" id="frmPush" method="post">
                                <input type="hidden" name="_token" value="KUIlaf6wzIPUNwYBCLiUCeU6b3f4PE3MxFgJp2O0">
                                <span class="check-box have-text">
                                    <input type="checkbox" name="pEmail" id="pEmail">
                                    <label for="pEmail">이메일</label>
                                </span>
                                <span class="check-box have-text">
                                    <input type="checkbox" name="pSms" id="pSms">
                                    <label for="pSms">문자메세지</label>
                                </span>
                                <span class="check-box have-text">
                                    <input type="checkbox" name="pAlarm" id="pAlarm">
                                    <label for="pAlarm">푸시알림</label>
                                </span>
                            </form>
                            <p>다양한 <span class="point">할인쿠폰과 이벤트</span>에 대한 정보를 보내드립니다.</p>
                            <a href="javascript:;" class="btn btn-xl btn-color-type08 btn-push">변경</a>
                        </dd>
                    </dl>
                </div>
                
                    <div class="mypageDesc2 license active">
                        <div class="topArea clearfix">
                            <strong class="tit04 clearfix">
                                운전면허 정보
                            </strong>
                        </div>
                        <p>등록된 면허 정보가 없습니다.</p>
                        <div class="btnGroup">
                            <a href="javascript:;" class="infoBtn btn-license">면허정보 등록</a>
                        </div>
                    </div>
                
                    <div class="mypageDesc2 license">
                        <div class="topArea clearfix">
                            <strong class="tit04 clearfix">
                                운전면허 정보
                            </strong>
                        </div>
                        
                        <dl>
                            <dt class="license-title">면허 종류</dt>
                            <dd class="license-content"></dd>
                        </dl>
                        
                        
                        
                        <dl>
                            <dt>면허 번호</dt>
                            <dd class="license-nums"></dd>
                        </dl>
                        <dl>
                            <dt>적성검사 만료일</dt>
                            <dd class="license-date1"></dd>
                        </dl>
                        <dl>
                            <dt>면허 발급일(갱신일)</dt>
                            <dd class="license-date2"></dd>
                        </dl>
                        <div class="btnGroup">
                            <a href="javascript:;" class="infoBtn btn-license">면허정보 변경</a>
                        </div>
                    </div>
                
                <div class="mypageDesc2">
                    <div class="topArea clearfix">
                        <strong class="tit04 clearfix">
                            회원탈퇴
                        </strong>
                    </div>
                    <p>렌트킹 이용에 불편하신 점이 있으셨다면, 탈퇴 전 고객센터로 문의 주시면 답변 드리겠습니다. <br>회원 탈퇴는 몇 가지 안내 및 확인을 거쳐서 진행 됩니다.</p>
                    <div class="btnGroup">
                        <a href="https://www.rentking.co.kr/myPage/memberLeave" class="infoBtn">회원탈퇴</a>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>