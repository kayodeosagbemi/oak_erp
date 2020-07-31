<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//namespace com\innovativesoftwaresystemsng\oakerp\model;
//use PDO;
/**
 * Description of User
 *
 * @author osagbemio
 */
class User {
    //put your code here
    
    public function __construct($id)
    {
        //Id parameterized
        if ($id > 0)
        {
             $this->createUserById($id);
        
        }
        $this->isChanged=false;
       
    }
    
    public function __destruct() {
        $this->conn=NULL;
    }
    
    public function initByUserid($usr) 
    {
        try {
            $this->conn = new PDO("mysql:host=localhost;dbname=oak_erp_db", "root", "");
            $sql_auth_usr_pwd="SELECT * FROM user ".
                    "WHERE username=:username";
            $stmt =  $this->conn->prepare($sql_auth_usr_pwd);
            $stmt->bindParam(":username", $usr);
            $stmt->execute();
            $result = $stmt->fetchall();
            foreach($result as $row)
            {
                $this->setId($row["Id"]);
                $this->setUsername($row['username']);
                $this->setEmail($row['email']);
                $this->setPassword($row['password']);
                $this->setSurname($row['surname']);
                $this->setFirstname($row['firstname']);
                $this->setMiddlename($row['middlename']);
                $this->setTitle($row['title']);
                $this->setRoleId($row['roleId']);
                $this->setReferralCode($row['referralCode']);
                $this->setCreateTime($row['create_time']);
            }
        } catch (Exception $ex) {
              
        } finally
        {
             $this->conn = NULL;
        }
    }
    private $conn = null;
    private $isChanged=false;
    private $username;
    public function getUsername()
    {
        return $this->username;
    }
    public function setUsername( $usr)
    {
        $this->username = $usr;
    }
    private $email;
    public function setEmail($em)
    {
        $this->email=$em;
    }
    public function getEmail()
    {
        return $this->email;
    }
    private $password; 
    public function getPassword()
    {
        return $this->password;
    }
    public function setPassword($pwd)
    {
        $this->password=$pwd;
    }
    private $create_time; //Readonly
    public function setCreateTime($createtime)
    {
        $this->create_time=$createtime;
    }
    public  function getCreateTime()
    {
        return $this->create_time;
    }
    private $surname;
    public function getSurname()
    {
        return $this->surname;
    }
    public function setSurname($sn)
    {
        $this->surname=$sn;
    }
    private $middlename;
    public function setMiddlename($mn)
    {
        $this->middlename=$mn;
    }
    public function getMiddlename()
    {
        return $this->middlename;
    }
    private $firstname;
    public function setFirstname($fn)
    {
        $this->firstname=$fn;
    }
    public function getFirstname()
    {
        return $this->firstname;
    }
    private $title;
    public function setTitle($t)
    {
        $this->title=$t;
    }
    public function getTitle()
    {
        return $this->title;
    }
    private $referralCode;
    public function setReferralCode($refCode)
    {
        $this->referralCode=$refCode;
    }
    public function getReferralCode()
    {
        return $this->referralCode;
    }
    private $roleId;
    public function getRoleId()
    {
        return $this->roleId;
    }
    public function setRoleId($roleid)
    {
        $this->roleId=$roleid;
    }
    private $id;
    
    public function setId($newId)
    {
        $this->id = $newId;
    }
    public function getId()
    {
        return $this->id;
    }
    private function setNotifiedChanged($isChanged)
    {
        $this->isChanged=$isChanged;
    }
    private function createUserById($id)
    {
        $sql_select_by_id="SELECT * FROM user WHERE ID=?";
        
    }
    static public function isAuthenticated($username, $password)
    {
        try {
             $conn = new PDO("mysql:host=localhost;dbname=oak_erp_db", "root", "");
            $sql_auth_usr_pwd="SELECT count(*) as numuser FROM user ".
                    "WHERE username=:username and password=:password";
            $stmt = $conn->prepare($sql_auth_usr_pwd);
            $stmt->bindParam(":username", $username);
            $stmt->bindParam(":password", $password);
            $stmt->execute();
            $result = $stmt->fetchall();
            
            foreach($result as $row)
            {
                if ($row['numuser'] > 0)
                    return TRUE;
                else 
                    return FALSE;
            }
             return FALSE;
        } catch (Exception $ex) {
               
        } finally
        {
             $conn = NULL;
        }
       return FALSE;
       
    }

    /** Get all users in array */
    static public function getAllUsers()
    {
        $sql_all_usrs="select * from user";
        $userArray =null;//Init to null
        try {
            $conn = new PDO("mysql:host=localhost;dbname=oak_erp_db", "root", "");
           
           $stmt = $conn->query($sql_all_usrs);
           $result=$stmt->fetchAll();

           foreach($result as $row)
           {
               $usrObj =new User(0);
               $usrObj->initByUserid($row['Id']);
               $userArray[] = $usrObj;               
           }
            
       } catch (Exception $ex) {
              
       } finally
       {
            $conn = NULL;
       }
      return $userArray;
    }
}
