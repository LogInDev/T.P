package com.foke.demo.controller;

import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.foke.demo.service.CartService;
import com.foke.demo.service.Paymentservice;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class ChartApiController {
    private final CartService cartService;
    private final Paymentservice paymentservice;
    
    @GetMapping("/cart/most-added-products")
    public ResponseEntity<List<Object[]>> getMostAddedProducts() {
        List<Object[]> mostAddedProducts = this.cartService.getMostAddedProducts();

        return ResponseEntity.ok(mostAddedProducts);
    }
    
    @GetMapping("/cart/most-added-store")
    public ResponseEntity<List<Object[]>> getMostAddedStore() {
        List<Object[]> mostAddedStore = this.cartService.getMostAddedStore();

        return ResponseEntity.ok(mostAddedStore);
    }
    
    @GetMapping("/payment/most-added-products")
    public ResponseEntity<List<Object[]>> getMostAddedProducts2() {
        List<Object[]> mostAddedProducts = this.paymentservice.getMostAddedProducts();

        return ResponseEntity.ok(mostAddedProducts);
    }
    
    @GetMapping("/payment/most-added-store")
    public ResponseEntity<List<Object[]>> getMostAddedStore2() {
        List<Object[]> mostAddedStore = this.paymentservice.getMostAddedStore();

        return ResponseEntity.ok(mostAddedStore);
    }
    
    @GetMapping("/payment/revenue")
    public ResponseEntity<List<Object[]>> getRevenue() {
        List<Object[]> revenue = this.paymentservice.getRevenue();

        return ResponseEntity.ok(revenue);
    }
}
