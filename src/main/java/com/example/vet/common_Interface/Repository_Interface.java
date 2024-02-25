package com.example.vet.common_Interface;

import java.util.List;
import java.util.Map;

public interface Repository_Interface {
    public List<Map<String, Object>> Select();
    public int Insert();
    public int Update();
    public int Delete();
}
