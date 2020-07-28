<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//namespace com\innovativesoftwaresystemsng\oakerp\model;
//use PDO;
/**
 * Description of Investor
 * 
 * @author osagbemio
 */
class Investor {
    static public function getTotalNumber()
    {
        $count=0;
        $sql_all_usrs="select count(*) as totalnumber from investor ".
                      "where recordStatus is not null and recordStatus <> 0";
        $userArray =null;//Init to null
        try {
            $conn = new PDO("mysql:host=localhost;dbname=oak_erp_db", "root", "");
           
           $stmt = $conn->query($sql_all_usrs);
           $result=$stmt->fetchAll();

           foreach($result as $row)
           {
               $count = $row['totalnumber'];   
           }
            
       } catch (Exception $ex) {
              
       } finally
       {
            $conn = NULL;
       }
    
        return $count;
    }
}