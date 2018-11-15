/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author usuario
 */
public class AccesoTest {
    
    public AccesoTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of validar method, of class Acceso.
     */
    @Test
    public void testValidar() {
        System.out.println("validar");
        String usuario = "luis";
        String contra = "123";
        Acceso instance = new Acceso();
        int expResult = 1;
        int result = instance.validar(usuario, contra);
        assertEquals(expResult, result);
        if(result != expResult){
            fail("The test case is a prototype.");
        }
        
    }
    
}
