package Controller;

import Entities.Cart;
import Entities.CartDetail;
import Entities.Vegetable;
import Repository.CartRepository;
import Repository.CartDetailRepository;
import Repository.VegetableRepository;

import com.fasterxml.jackson.core.JsonParser;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.json.JSONParser;

import org.apache.tomcat.util.json.ParseException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 *
 * @author Ngoc Huyen
 */
@Controller
public class CartController {

    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private CartDetailRepository cartDetailRepository;
    @Autowired
    private VegetableRepository vegetableRepository;

    @GetMapping("/checkout")
    public String ShowCheckOut(HttpSession session, Model m) {
        if (session.getAttribute("username") == null) {
            m.addAttribute("error", "Please login to continue shopping");
            return "login";
        }
        return "checkout";
    }

    @PostMapping("/checkout")
    @ResponseBody
    public String addCart(HttpSession session, HttpServletRequest request) throws ParseException, NoSuchFieldException {
        int userId = (Integer) session.getAttribute("idUser");
        String total = request.getParameter("total");
        String listCarts = request.getParameter("listCarts");

        Cart newCart = new Cart();
        newCart.setCustomerID(userId);
        newCart.setNote("Order Test");
        newCart.setTotal(Float.parseFloat(total));
        newCart.setDate(new Date());
        cartRepository.save(newCart);

        JSONParser jsonParser = new JSONParser(listCarts);
        ArrayList<Object> newArray = jsonParser.parseArray();
        for (Object object : newArray) {
            String item = object.toString();
            ArrayList<String> getListData = splitString(item);
            CartDetail detail = new CartDetail();
            detail.setOrderID(newCart.getOrderID());
            detail.setVegetableID(Integer.parseInt(getAnswer(getListData.get(0))));
            detail.setQuantity(Integer.parseInt(getAnswer(getListData.get(3))));
            detail.setPrice(Float.parseFloat(getAnswer(getListData.get(3))) * Float.parseFloat(getAnswer(getListData.get(4))));
            cartDetailRepository.save(detail);
        }
        return "home";
    }

    public ArrayList<String> splitString(String input) {
        ArrayList<String> result = new ArrayList<String>();
        String newString = input.replaceAll("[{}]", "");
        StringTokenizer tokens = new StringTokenizer(newString, ",");
        while (tokens.hasMoreTokens()) {
            String token = tokens.nextToken();
            result.add(token);
        }
        return result;
    }

    public String getAnswer(String input) {
        String[] data = input.split("=");
        return data[1];
    }

    @GetMapping("/cart")
    public String ShowCart(HttpSession session, Model m) {
        Iterable<Vegetable> listVetgetable = vegetableRepository.findAll();
        m.addAttribute("dataVegetable", listVetgetable);
        return "cart";
    }
}
