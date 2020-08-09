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

    public function __construct($id)
    {
        //TODO: implement appropriate constructor
        $this->initById($id);
    }
    public function __destruct()
    {
        //TODO: implement appropriate destructor
        $this->connObj=NULL;
    }

    public function initById($investorId) 
    {
        if ($investorId <= 0) 
        {
            return;
        }
            
        try {
            $this->connObj = new PDO("mysql:host=localhost;dbname=oak_erp_db", "root", "");
            $sql_auth_usr_pwd="SELECT * FROM investor ".
                    "WHERE Id=:id";
            $stmt =  $this->connObj->prepare($sql_auth_usr_pwd);
            $stmt->bindParam(":id", $investorId);
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
             $this->connObj = NULL;
        }
    }
    private $connObj = null;

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
    public function getCreateByUserId()
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

    /**
     * Saves this instance to the database table "investor"
     * 
     */
    public function save()
    {
        $save_status=FALSE;
        $sql_proc = "CALL sp_investor_new(";
        $sql_proc .= ":";
        $OPEN_PARENT = "(";
        $CLOSE_PAREN = ")";
$PARAMETERS=<<<PARAMS
:username ,
:email ,
:pwd ,
:title ,
:surname ,
:middlename ,
:firstname ,
:dob ,
:gender ,
:mobilephoneno ,
:residenceAddr ,
:countryOfResidence ,
:createdByUserId ,
:investorReferralCode ,
:etlID ,
:etlCreationTime ,
:creationApprovedByUserId ,
:creationApproval ,
:recordStatus ,
:referrerId ,
:ID 
PARAMS;
        $sql = "CALL " . $sql_procedure_name . $OPEN_PARENT . $PARAMETERS . $CLOSE_PAREN;
        try {
            $this->connObj = new PDO("mysql:host=localhost;dbname=oak_erp_db", "root", "");
            
            $stmt =  $this->conn->prepare($sql);
            $stmt->bindParam(":username", $this->getUsername(), PDO::PARAM_STR, 20);
            $stmt->bindParam(":email", $this->getEmail(), PDO::PARAM_STR, 255);
            $stmt->bindParam(":pwd", $this->getPassword(), PDO::PARAM_STR, 32);
            $stmt->bindParam(":title", $this->getTitle(), PDO::PARAM_STR, 45);
            $stmt->bindParam(":surname", $this->getSurname(), PDO::PARAM_STR, 50);
            $stmt->bindParam(":middlename", $this->getMiddlename(), PDO::PARAM_STR, 50);
            $stmt->bindParam(":firstname", $this->getFirstname(), PDO::PARAM_STR, 50);
            $stmt->bindParam(":dob", $this->getDateOfBirth(), PDO::PARAM_STR);
            $stmt->bindParam(":gender", $this->getGender(), PDO::PARAM_STR_CHAR, 1);
            $stmt->bindParam(":mobilephoneno", $this->getMobilePhoneNumber(), PDO::PARAM_STR, 20);
            $stmt->bindParam(":residenceAddr", $this->getResidentialAddress(), PDO::PARAM_STR , 300);
            $stmt->bindParam(":countryOfResidence", $this->getCountryOfResidence(), PDO::PARAM_STR, 300);
            $stmt->bindParam(":createdByUserId", $this->getCreateByUserId(), PDO::PARAM_INT);
            $stmt->bindParam(":investorReferralCode", $this->getInvestorReferralCode(), PDO::PARAM_STR, 45);
            $stmt->bindParam(":etlID", $this->getETLId(), PDO::PARAM_STR , 45);
            $stmt->bindParam(":etlCreationTime", $this->getEtlCreateTime(), PDO::PARAM_STR , 50);
            $stmt->bindParam(":creationApprovedByUserId", $this->getCreationApprovalDate(), PDO::PARAM_STR , 50);
            $stmt->bindParam(":creationApproval", $this->getCreationApproval(), PDO::PARAM_INT);
            $stmt->bindParam(":recordStatus", $this->getRecordStatus(), PDO::PARAM_INT);
            $stmt->bindParam(":referrerId", $this->getReferrerId(), PDO::PARAM_INT );
            $localVar_Id=$this->getId();
            $stmt->bindParam(":ID", $localVar_Id, PDO::PARAM_INT|PDO::PARAM_INPUT_OUTPUT);

            $stmt->execute();
            $this->setId($localVar_Id); //Set the ID that was returned by the database SP.
            
        } catch (Exception $ex) {
              $this->setId(NULL); //Set the ID to NULL to indicate nothing
        } finally
        {
             $this->conn = NULL;
        }
    }

}