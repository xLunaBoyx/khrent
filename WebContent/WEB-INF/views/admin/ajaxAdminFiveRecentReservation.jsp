<%@page import="com.kh.semi.reservation.model.vo.Reservation"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<Reservation> list = (List<Reservation>) request.getAttribute("list");
%>

<%
for (Reservation reservation : list) {
%>
					<tr role="row" class="odd">
					<th scope="row" tabindex="0" class="sorting_1">
         
									<div class="patient_thumb d-flex align-items-center" id="odd">
                                                <p><%= reservation.getReserNo() %></p>
                                            </div>
                                        </th>
                                        <td><%= reservation.getMemberId() %></td>
                                        <td><%= reservation.getCarName() %></td>
                                        <td><%= reservation.getStartDate() %></td>
                                        <td><%= reservation.getEndDate() %></td>
                    </tr>
<%
}
%>
                                       
    