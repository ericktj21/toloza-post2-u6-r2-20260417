package com.universidad.mvc.model;

import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {
    private static final List<Producto> lista = new ArrayList<>();
    private static int contadorId = 1;

    static {
        saveInternal(new Producto(0, "Laptop Pro 15", "Computadoras", 1299.99, 10));
        saveInternal(new Producto(0, "Monitor 27 4K", "Monitores", 549.00, 25));
        saveInternal(new Producto(0, "Teclado Mecanico", "Perifericos", 89.99, 50));
    }

    public List<Producto> findAll() {
        return new ArrayList<>(lista);
    }

    public Producto findById(int id) {
        return lista.stream().filter(p -> p.getId() == id).findFirst().orElse(null);
    }

    public void save(Producto p) {
        saveInternal(p);
    }

    public void update(Producto p) {
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getId() == p.getId()) {
                lista.set(i, p);
                return;
            }
        }
    }

    public void delete(int id) {
        lista.removeIf(p -> p.getId() == id);
    }

    private static void saveInternal(Producto p) {
        p.setId(contadorId++);
        lista.add(p);
    }
}
