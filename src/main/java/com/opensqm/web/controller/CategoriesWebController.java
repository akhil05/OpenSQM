package com.opensqm.web.controller;

import java.util.UUID;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.opensqm.json.Category;
import com.opensqm.json.CategoryAddRq;
import com.opensqm.json.CategoryAddRs;
import com.opensqm.json.CategoryDelRq;
import com.opensqm.json.CategoryDelRs;
import com.opensqm.json.CategoryInqRq;
import com.opensqm.json.CategoryInqRs;
import com.opensqm.json.CategoryModRq;
import com.opensqm.json.CategoryModRs;
import com.opensqm.json.RequestHeader;
import com.opensqm.json.Status;
import com.opensqm.web.json.CategoryAddForm;
import com.opensqm.web.json.CategoryDelForm;
import com.opensqm.web.json.CategoryModForm;

/**
 * Web controller to handle the category page.
 * 
 * @author Jim Shain
 *
 */
@Controller
public class CategoriesWebController {

	/**
	 * Category inquiry web service URL.
	 */
	// TODO: This is hard coded for now. Should come from a property file.
	private final static String CATEGORY_INQ_URL = "http://localhost:8080/OpenSQM-1.0/v1.0/categoryInq";

	/**
	 * Category add web service URL.
	 */
	// TODO: This is hard coded for now. Should come from a property file.
	private final static String CATEGORY_ADD_URL = "http://localhost:8080/OpenSQM-1.0/v1.0/categoryAdd";
	
	/**
	 * Category modify web service URL.
	 */
	// TODO: This is hard coded for now. Should come from a property file.
	private final static String CATEGORY_MOD_URL = "http://localhost:8080/OpenSQM-1.0/v1.0/categoryMod";

	/**
	 * Category delete web service URL.
	 */
	// TODO: This is hard coded for now. Should come from a property file.
	private final static String CATEGORY_DEL_URL = "http://localhost:8080/OpenSQM-1.0/v1.0/categoryMod";
	
	/**
	 * Processes the web page get.
	 * 
	 * @return
	 */
	@RequestMapping(value = "categories", method = RequestMethod.GET)
	public String getCategories() {
		return "categories";
	}

	/**
	 * Processes the category inquiry request.
	 * 
	 * @param request
	 *            JSON request string
	 * @return JSON response string
	 */
	@RequestMapping(value = "categoryInqWeb", method = RequestMethod.POST)
	public @ResponseBody String categoryInq(@RequestBody String request) {
		Gson gson = new Gson();
		CategoryInqRq categoryInqRq = new CategoryInqRq();
		CategoryInqRs categoryInqRs = null;
		String json = null;

		categoryInqRq.setRequestHeader(new RequestHeader());
		categoryInqRq.getRequestHeader().setRquid(UUID.randomUUID().toString());
		try {
			request = gson.toJson(categoryInqRq);
			json = send(CATEGORY_INQ_URL, request);
		} catch (Exception e) {
			e.printStackTrace();
			categoryInqRs = new CategoryInqRs();
			categoryInqRs.setStatus(new Status("999", e.toString()));
			json = gson.toJson(categoryInqRs);
		}

		return json;
	}

	/**
	 * Processes the category add request.
	 * 
	 * @param request
	 *            JSON request string
	 * @return JSON response string
	 */
	@RequestMapping(value = "categoryAddWeb", method = RequestMethod.POST)
	public @ResponseBody String categoryAdd(@RequestBody String request) {
		String json = null;
		CategoryAddRq categoryAddRq = new CategoryAddRq();
		CategoryAddRs categoryAddRs = null;
		Gson gson = new Gson();
		CategoryAddForm categoryAddForm = null;

		try {
			categoryAddForm = gson.fromJson(request, CategoryAddForm.class);
			categoryAddRq.setRequestHeader(new RequestHeader());
			categoryAddRq.getRequestHeader().setRquid(
					UUID.randomUUID().toString());
			categoryAddRq.setCategory(new Category());
			categoryAddRq.getCategory().setText(categoryAddForm.getText());
			categoryAddRq.getCategory().setWeight(
					Integer.parseInt(categoryAddForm.getWeight()));
			request = gson.toJson(categoryAddRq);
			json = send(CATEGORY_ADD_URL, request);
		} catch (Exception e) {
			e.printStackTrace();
			categoryAddRs = new CategoryAddRs();
			categoryAddRs.setStatus(new Status("999", e.toString()));
			json = gson.toJson(categoryAddRs);
		}
		return json;
	}

	
	/**
	 * Processes the category modify request.
	 * 
	 * @param request
	 *            JSON request string
	 * @return JSON response string
	 */
	@RequestMapping(value = "categoryModWeb", method = RequestMethod.POST)
	public @ResponseBody String categoryMod(@RequestBody String request) {
		String json = null;
		CategoryModRq categoryModRq = new CategoryModRq();
		CategoryModRs categoryModRs = null;
		Gson gson = new Gson();
		CategoryModForm categoryModForm = null;

		try {
			categoryModForm = gson.fromJson(request, CategoryModForm.class);
			categoryModRq.setRequestHeader(new RequestHeader());
			categoryModRq.getRequestHeader().setRquid(
					UUID.randomUUID().toString());
			categoryModRq.setCategory(new Category());
			categoryModRq.getCategory().setText(categoryModForm.getText());
			categoryModRq.getCategory().setWeight(
					Integer.parseInt(categoryModForm.getWeight()));
			request = gson.toJson(categoryModRq);
			json = send(CATEGORY_MOD_URL, request);
		} catch (Exception e) {
			e.printStackTrace();
			categoryModRs = new CategoryModRs();
			categoryModRs.setStatus(new Status("999", e.toString()));
			json = gson.toJson(categoryModRs);
		}
		return json;
	}

	/**
	 * Processes the category delete request.
	 * 
	 * @param request
	 *            JSON request string
	 * @return JSON response string
	 */
	@RequestMapping(value = "categoryDelWeb", method = RequestMethod.POST)
	public @ResponseBody String categoryDel(@RequestBody String request) {
		String json = null;
		CategoryDelRq categoryDelRq = new CategoryDelRq();
		CategoryDelRs categoryDelRs = null;
		Gson gson = new Gson();
		CategoryDelForm categoryDelForm = null;

		try {
			categoryDelForm = gson.fromJson(request, CategoryDelForm.class);
			categoryDelRq.setRequestHeader(new RequestHeader());
			categoryDelRq.getRequestHeader().setRquid(
					UUID.randomUUID().toString());
			categoryDelRq.setCategoryId(categoryDelForm.getCategoryId());
			request = gson.toJson(categoryDelRq);
			json = send(CATEGORY_DEL_URL, request);
		} catch (Exception e) {
			e.printStackTrace();
			categoryDelRs = new CategoryDelRs();
			categoryDelRs.setStatus(new Status("999", e.toString()));
			json = gson.toJson(categoryDelRs);
		}
		return json;
	}

	private String send(String url, String data) throws Exception {
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(url);
		CloseableHttpResponse response = null;
		String json = null;

		System.out.println("Request = " + data);
		httpPost.setEntity(new StringEntity(data));
		response = httpclient.execute(httpPost);
		if (response.getStatusLine().getStatusCode() == 200) {
			json = EntityUtils.toString(response.getEntity());
			System.out.println("Respone = " + json);
		} else {
			System.out.println("HTTP Error: "
					+ response.getStatusLine().getStatusCode());
			throw new Exception(response.getStatusLine().toString());
		}

		return json;
	}

} // Class end