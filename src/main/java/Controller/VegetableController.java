/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Entities.CartDetail;
import Entities.Category;
import Entities.Vegetable;
import Repository.CartDetailRepository;
import Repository.CategoryRepository;
import Repository.VegetableRepository;
import java.util.ArrayList;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Ngoc Huyen
 */
@Controller
public class VegetableController {

    @Autowired
    private VegetableRepository vegetableRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private CartDetailRepository cartDetailRepository;

    @GetMapping("/shop")
    public String getAll(Model m) {
        Iterable<Vegetable> listVetgetable = vegetableRepository.findAll();
        Iterable<Category> listCategory = categoryRepository.findAll();
        m.addAttribute("dataVegetable", listVetgetable);
        m.addAttribute("dataCategory", listCategory);
        /*
        Iterable<Category> listCate = categoryRepository.findAll();
        ArrayList<CartDetail> list2 = cartDetailRepository.getVegetableByOrderDetail();
        ArrayList<Vegetable> listvege = new ArrayList<>();
        for (int i = 0; i < list2.size()-3; i++) {
            Vegetable veg = vegetableRepository.getVegetableByID(list2.get(i).getVegetableID().toString());
            listvege.add(veg);
        }
        Iterable<Vegetable> listvege2 = listvege;
        System.out.println(list2);
        System.out.println(listCate);
        m.addAttribute("dataCategory", listCate);
        m.addAttribute("dataVegetable", listvege2);*/
        return "shop";

    }

    @GetMapping("/shop/category")
    public String getVegetableByCategory(Model m, @RequestParam(required = false) String IdCategory) {
        Iterable<Vegetable> list = vegetableRepository.getVegetablesByCategory(IdCategory);
        Iterable<Category> listCate = categoryRepository.findAll();
        m.addAttribute("dataCategory", listCate);
        m.addAttribute("dataVegetable", list);
        return "shop";
    }

    @GetMapping("/shop/search")
    public String SearchProduct(Model m, String keyword) {
        Iterable<Vegetable> list = vegetableRepository.getVegetableByNameforSearching(keyword);
        Iterable<Category> listCate = categoryRepository.findAll();
        m.addAttribute("dataCategory", listCate);
        m.addAttribute("dataVegetable", list);
        return "shop";
    }

    @GetMapping("/shop/product")
    public String getVegetableByID(Model m, @RequestParam(required = false) String IdProduct) {
        Vegetable v = vegetableRepository.getVegetableByID(IdProduct);
        Iterable<Category> listCategory = categoryRepository.findAll();
        m.addAttribute("dataCategory", listCategory);
        m.addAttribute("dataVegetable", v);
        return "product";
    }

//gợi ý tìm kiếm
    @GetMapping("/hint")
    public @ResponseBody
    String ShowHint(Model model, HttpServletRequest request) {
        String name = request.getParameter("keyword");
        String output;
        Iterable<Vegetable> list = vegetableRepository.getVegetableByNameforSearching(name);
        Integer countLiTag = 0;
        if (list != null) {
            output = "<ul class='dropdown-menu' style='display:block;overflow-y:scroll;max-height: 245px;right: 7% !important;'>";
            for (Vegetable vegetable : list) {
                output += "<li><a href='" + "/shop/product?idProduct=" + vegetable.getVegetableID() + "'class='item'>" + vegetable.getVegetable_name() + "</a></li>";
                countLiTag++;
            }
            output += "</ul>";
            if (countLiTag > 0) {
                return output;
            } else {
                return null;
            }
        }
        return null;
    }

    @GetMapping("/bestselling")
    public String getVegetableByOrderdetail(Model m, @RequestParam(required = false) String idProduct) {
        ArrayList<CartDetail> list = cartDetailRepository.getVegetableByOrderDetail();
        ArrayList<Vegetable> listvege = new ArrayList<>();
        for (int i = 0; i < list.size() - 3; i++) {
            Vegetable veg = vegetableRepository.getVegetableByID(list.get(i).getVegetableID().toString());
            listvege.add(veg);
        }
        m.addAttribute("dataVegetable", listvege);
        return "bestselling";
    }
}
