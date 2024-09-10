

import static org.junit.jupiter.api.Assertions.*;
import java.time.LocalDateTime;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.model.Order;

public class test {
    
    private Order order;
    private LocalDateTime orderDate;

	/*
	 * @BeforeEach public void setUp() { orderDate = LocalDateTime.now(); order =
	 * new Order("123", orderDate, "Laptop", 2, 1000.0, 2000.0, true, "Alice",
	 * "Credit Card", "INV001", "Main Outlet", "Online"); }
	 */

    // Test for constructor with full parameters
    @Test
    public void testFullConstructor() {
        assertEquals("123", order.getId());
        assertEquals(orderDate, order.getDate());
        assertEquals("Laptop", order.getItem());
        assertEquals(2, order.getQty());
        assertEquals(1000.0, order.getUnitPrice());
        assertEquals(2000.0, order.getTotal());
        assertTrue(order.getPending());
        assertEquals("Alice", order.getOrderBy());
        assertEquals("Credit Card", order.getPayment());
        assertEquals("INV001", order.getInvoiceNo());
        assertEquals("Main Outlet", order.getOutlet());
        assertEquals("Online", order.getOrderType());
    }

    // Test for the basic constructor
    @Test
    public void testBasicConstructor() {
        Order basicOrder = new Order("124", orderDate, "Phone", 1, 500.0, 500.0, false);
        assertEquals("124", basicOrder.getId());
        assertEquals(orderDate, basicOrder.getDate());
        assertEquals("Phone", basicOrder.getItem());
        assertEquals(1, basicOrder.getQty());
        assertEquals(500.0, basicOrder.getUnitPrice());
        assertEquals(500.0, basicOrder.getTotal());
        assertFalse(basicOrder.getPending());
    }

    // Test for getter and setter of ID
    @Test
    public void testSetAndGetId() {
        order.setId("456");
        assertEquals("456", order.getId());
    }

    // Test for getter and setter of Item
    @Test
    public void testSetAndGetItem() {
        order.setItem("Tablet");
        assertEquals("Tablet", order.getItem());
    }

    // Test for getter and setter of Quantity
    @Test
    public void testSetAndGetQty() {
        order.setQty(5);
        assertEquals(5, order.getQty());
    }

    // Test for getter and setter of Unit Price
    @Test
    public void testSetAndGetPrice() {
        order.setUnitPice(1500.0);
        assertEquals(1500.0, order.getUnitPrice());
    }

    // Test for getter and setter of Total
    @Test
    public void testSetAndGetTotal() {
        order.setTotal(3000.0);
        assertEquals(3000.0, order.getTotal());
    }

    // Test for getter and setter of Pending status
    @Test
    public void testSetAndGetPending() {
        order.setPending(false);
        assertFalse(order.getPending());
    }

    // Test for getter and setter of OrderBy
    @Test
    public void testSetAndGetOrderBy() {
        order.setOrderBy("Bob");
        assertEquals("Bob", order.getOrderBy());
    }

    // Test for getter and setter of Payment
    @Test
    public void testSetAndGetPayment() {
        order.setPayment("Cash");
        assertEquals("Cash", order.getPayment());
    }

    // Test for getter and setter of Invoice Number
    @Test
    public void testSetAndGetInvoiceNo() {
        order.setInvoiceNo("INV002");
        assertEquals("INV002", order.getInvoiceNo());
    }

    // Test for getter and setter of Outlet
    @Test
    public void testSetAndGetOutlet() {
        order.setOutlet("Branch Outlet");
        assertEquals("Branch Outlet", order.getOutlet());
    }

    // Test for getter and setter of Order Type
    @Test
    public void testSetAndGetOrderType() {
        order.setOrderType("In-Store");
        assertEquals("In-Store", order.getOrderType());
    }

    // Test default constructor
    @Test
    public void testDefaultConstructor() {
        Order emptyOrder = new Order();
        assertNull(emptyOrder.getId());
        assertNull(emptyOrder.getDate());
        assertNull(emptyOrder.getItem());
        assertEquals(0, emptyOrder.getQty());
        assertEquals(0.0, emptyOrder.getUnitPrice());
        assertEquals(0.0, emptyOrder.getTotal());
        assertFalse(emptyOrder.getPending());
        assertNull(emptyOrder.getOrderBy());
        assertNull(emptyOrder.getPayment());
        assertNull(emptyOrder.getInvoiceNo());
        assertNull(emptyOrder.getOutlet());
        assertNull(emptyOrder.getOrderType());
    }
}
