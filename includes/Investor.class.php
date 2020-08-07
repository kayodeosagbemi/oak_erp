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
              echo "DEBUG>>There was an error connecting to DB within getTotalNumber()<br />".$ex->getMessage();
       } finally
       {
            $conn = NULL;
       }
    
        return $count;
    }

    //Declare private fields
    private $username;
    public function setUsername($usn)
    {
        $this->username=$usn;
    }
    public function getUsername()
    {
        return $this->username;
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
    public function setPassword($pwd)
    {
        $this->password=$pwd;
    }
    public function getPassword()
    {
        return $this->password;
    }

    private $createTime;
    public function setCreateTime($create_time)
    {
        $this->createTime=$create_time;
    }
    public function getCreateTime()
    {
        return $this->createTime;
    }

    private $title;
    public function setTitle($title)
    {
        $this->title=$title;
    }
    public function getTitle()
    {
        return $this->title;
    }

    private $surname;
    public function setSurname($sn)
    {
        $this->surname = $sn;
    }
    public function getSurname()
    {
        return $this->surname;
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
    public function setFirstname($firstname)
    {
        $this->firstname=$firstname;
    }
    public function getFirstname()
    {
        return $this->firstname;
    }

    private $dateOfBirth;
    public function setDateOfBirth($dob)
    {
        $this->dateOfBirth=$dob;
    }
    public function getDateOfBirth()
    {
        return $this->dateOfBirth;
    }

    private $gender;
    public function setGender($gn)
    {
        $this->gender=$gn;
    }
    public function getGender()
    {
        return $this->gender;
    }

    private $mobilephoneno;
    public function setMobilePhoneNumber($mobile)
    {
        $this->mobilephoneno= $mobile;
    }
    public function getMobilePhoneNumber()
    {
        return $this->mobilephoneno;
    } 

    private $residentialAddress;
    public function setResidentialAddress($addr)
    {
        $this->residentialAddress=$addr;
    }
    public function getResidentialAddress()
    {
        return $this->residentialAddress;
    }

    private $countryOfResidence;
    public function setCountryOfResidence($country)
    {
        $this->countryOfResidence = $country;
    }
    public function getCountryOfResidence()
    {
        return $this->countryOfResidence;
    }

    private $createdByUserId;
    public function setCreatedByUserId($creatorUserId)
    {
        $this->createdByUserId=$creatorUserId;
    }
    public function getCreateBuserId()
    {
        return $this->createdByUserId;
    }

    private $investorReferralCode;
    public function setInvestorReferralCode($referralCode)
    {
        $this->investorReferralCode=$referralCode;
    }
    public function getInvestorReferralCode()
    {
        return $this->investorReferralCode;
    }

    private $Id=NULL;
    public function setId($id)
    {
        $this->Id=$id;
    }
    public function getId()
    {
        return $this->Id;
    }

    private $etlId; //ID from the ETL system. It is a string data type
    public function setETLId($etlID)
    {
        $this->etlId=$etlID;
    }
    public function getETLId()
    {
        return $this->etlId;
    }

    private $etlCreateTime;
    public function setEtlCreateTime($etlTime)
    {
        $this->etlCreateTime=$etlTime;
    }
    public function getEtlCreateTime()
    {
        return $this->etlCreateTime;
    }

    private $creationApprovedByUserId;
    public function setCreationApprovedByUserId($approverUserId)
    {
        $this->creationApprovedByUserId = $approverUserId;
    }

    private $creationApprovalDate;
    public function setCreationApprovalDate($approvalDate)
    {
        $this->creationApprovalDate=$approvalDate;
    }
    public function getCreationApprovalDate()
    {
        return $this->creationApprovalDate;
    }

    private $recordStatus;
    public function setRecordStatus($record_status)
    {
        $this->recordStatus=$record_status;
    }

    private $referrerId;
    public function setReferrerId($referrer_id)
    {
        $this->referrerId=$referrer_id;
    }
    public function getReferrerId()
    {
        return $this->referrerId;
    }

    public function save()
    {
        $sql_proc = "CALL sp_investor_new(";
        $sql_proc .= ":";
    }

}