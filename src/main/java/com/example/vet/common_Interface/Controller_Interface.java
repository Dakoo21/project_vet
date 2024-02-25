package com.example.vet.common_Interface;

import org.springframework.ui.Model;

public interface Controller_Interface {
    public String SelectList(Model model);
    public String ListDetail(Model model);
    public String Update();
    public String Insert();
    public String Delete();
}
