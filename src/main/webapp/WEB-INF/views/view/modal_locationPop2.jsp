<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal inmodal fade"  id="locationPop" tabindex="-1"  role="dialog"  aria-hidden="true">
				  <div class="modal-dialog modal-lg" style="width:80%;min-width:360px">
				              <div class="modal-content" style="display:block;">
				                         <div class="modal-header">
	                                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		                                            <h4 class="modal-title" id="s_title">내위치변경</h4>
			                                        </div>
			                                        <div class="modal-body" style="width:100%">
					                                  <div class="ibox-content">
					                                    <form method="get" onsubmit="return false" action="return false">
						                                    <div class="form-group  row">
							                                    <div class="col-sm-12">
							                                    	<input type="text" class="form-control" id="location" readonly="readonly" onclick="postCode2()">
							                                    <div id="wrap2" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
							            							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode2()" alt="접기 버튼">
							        							</div>
							                                    	</div>
							                                </div>
							                              </form>
													</div>
			                            </div>
			                            	<div class="modal-footer">
									                                            <button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
																					   <% if(String.valueOf(request.getAttribute("type")).equals("A01")){ %>
																					<button type="button" class="btn btn-primary" onclick="updateAddressLon()">수정</button>
																				<% }else{  %>
																					<button type="button" class="btn btn-primary" onclick="updateAddress()">수정</button>
																				<% } %>
									                                            
									                                        </div>
				                  </div>
			            </div>
			            <script type="text/javascript">
			        	function updateAddress(){
			           		Kajax("/action/updateAddress",{
			           			location : $("#location").val()
			           			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
			           			,lon : $("#location").attr("lon")
								,lat : $("#location").attr("lat")
			           		},function(res){
			           			if(res.success){
			           				Kalert("수정이 완료되었습니다.","",function(){
		            					location.reload();
		            				});
			           			}
			           		})
			           	}
			           	function updateAddressLon(){
			           		Kajax("/action/updateAddress",{
			           			address : $("#location").val()
			           			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
			           			,lon : $("#location").attr("lon")
								,lat : $("#location").attr("lat")
			           		},function(res){
			           			if(res.success){
			           				Kalert("위치가 변경되었습니다.","",function(){
		            					location.reload();
		            				});
			           			}
			           		})
			           	}
			            var geocoder = new daum.maps.services.Geocoder();
			            var element_wrap2 = document.getElementById('wrap2');
			            function foldDaumPostcode2() {
			                // iframe을 넣은 element를 안보이게 한다.
			                element_wrap2.style.display = 'none';
			            }
			            function postCode2() {
			                // 현재 scroll 위치를 저장해놓는다.
			                var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
			                new daum.Postcode({
			                    oncomplete: function(data) {
			                        // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                        var addr = ''; // 주소 변수
			                        var extraAddr = ''; // 참고항목 변수

			                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                            addr = data.roadAddress;
			                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                            addr = data.jibunAddress;
			                        }

			                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                        if(data.userSelectedType === 'R'){
			                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                                extraAddr += data.bname;
			                            }
			                            // 건물명이 있고, 공동주택일 경우 추가한다.
			                            if(data.buildingName !== '' && data.apartment === 'Y'){
			                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                            }
			                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                            if(extraAddr !== ''){
			                                extraAddr = ' (' + extraAddr + ')';
			                            }
			                            // 조합된 참고항목을 해당 필드에 넣는다.
			                            $("#location").val(extraAddr);
			                        
			                        } else {
			                        	$("#location").val("");
			                        }

			                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                        $("#location").val(addr);
			                        geocoder.addressSearch(data.address, function(results, status) { // 정상적으로 검색이 완료됐으면
			                        	if (status === daum.maps.services.Status.OK) {
			                        		var result = results[0];
			                        		//첫번째 결과의 값을 활용 
			                        		// 해당 주소에 대한 좌표를 받아서 
			                        		var coords = new daum.maps.LatLng(result.y, result.x);
			                        		//$("#Location").val(result.y + ","+ result.x);
			                        		$("#location").attr("lon",result.y);
			                        		$("#location").attr("lat",result.x);
			                        		element_wrap2.style.display = 'none';
			                        		} 
			                        });
			                        // iframe을 넣은 element를 안보이게 한다.
			                        element_wrap2.style.display = 'none';
			                        // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
			                        document.body.scrollTop = currentScroll;
			                    },
			                    // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
			                    onresize : function(size) {
			                    	element_wrap2.style.height = size.height+'px';
			                    },
			                    width : '100%',
			                    height : '100%'
			                }).embed(element_wrap2);
			                // iframe을 넣은 element를 보이게 한다.
			                element_wrap2.style.display = 'block';
			            }
			            </script>
		  </div>