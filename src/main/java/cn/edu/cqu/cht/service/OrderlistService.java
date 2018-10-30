package cn.edu.cqu.cht.service;
/**
 * @author CHT
 * @date 创建时间：2018年5月4日 下午2:29:23
 * @version 1.0
 */

import java.util.ArrayList;
import java.util.List;

import cn.edu.cqu.cht.model.Orderlist;

public interface OrderlistService {
	public List<Orderlist> findAllOrders(int offset, int limit);

	public List<Orderlist> findActiveOrders(String province, String city, String area,int offset, int limit);

	public List<Orderlist> findByRecipientPhone(String recipientPhone, int offset, int limit);

	public Orderlist findByOrderId(String orderId);

	public List<Orderlist> findByUserId(Integer userId,int offset,int limit);
	
	public boolean insertOrder(Orderlist order);

	public boolean addOrder(String orderId, Integer userId, String senderName, String senderPhone, String senderProvince,
			String senderCity, String senderArea, String senderAddr, String recipientName, String recipientPhone,
			String recipientProvince, String recipientCity, String recipientArea, String recipientAddr, String kind,
			Double weight, String notes);

	public boolean updateOrder(Orderlist order);

	public boolean deleteByOrderId(Integer orderId);

	public ArrayList<String> showLogistics(String logistics);
}
