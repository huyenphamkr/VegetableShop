/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Entities.Vegetable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Ngoc Huyen
 */
@Controller
public class HomeController {

    @GetMapping("/home")
    public String ShowHomePage() {
        return "/index";
    }

    @GetMapping("/introduce")
    public String ShowIntroducePage() {
        return "/introduce";
    }

    @GetMapping("/contact")
    public String ShowContactPage() {
        return "/contact";
    }
}
