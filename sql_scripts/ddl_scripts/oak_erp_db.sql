-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Oak_Erp_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Oak_Erp_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Oak_Erp_DB` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `Oak_Erp_DB` ;

-- -----------------------------------------------------
-- Table `Oak_Erp_DB`.`privilege`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Oak_Erp_DB`.`privilege` (
  `name` VARCHAR(20) NOT NULL,
  `Id` INT NOT NULL AUTO_INCREMENT,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  PRIMARY KEY (`Id`));

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Oak_Erp_DB`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Oak_Erp_DB`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `privilegeId` INT NULL,
  `privilegeValue` VARCHAR(10) NULL,
  PRIMARY KEY (`id`),
  INDEX `privilegeId_idx` (`privilegeId` ASC),
  CONSTRAINT `privilegeId`
    FOREIGN KEY (`privilegeId`)
    REFERENCES `Oak_Erp_DB`.`privilege` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Oak_Erp_DB`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Oak_Erp_DB`.`user` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `surname` VARCHAR(100) NOT NULL,
  `middlename` VARCHAR(100) NULL,
  `firstname` VARCHAR(100) NOT NULL,
  `title` VARCHAR(45) NULL,
  `referralCode` VARCHAR(45) NOT NULL COMMENT 'A referral code for each staff who can refer a customer and is eligible to a reward as a result.',
  `roleId` INT NOT NULL,
  PRIMARY KEY (`Id`, `username`),
  INDEX `roleId_idx` (`roleId` ASC),
  UNIQUE INDEX `referralCode_UNIQUE` (`referralCode` ASC),
  CONSTRAINT `roleId`
    FOREIGN KEY (`roleId`)
    REFERENCES `Oak_Erp_DB`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Oak_Erp_DB`.`investor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Oak_Erp_DB`.`investor` (
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NULL,
  `createTime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `title` VARCHAR(45) NULL COMMENT 'Mr, Mrs, Miss, Chief etc',
  `surname` VARCHAR(50) NULL,
  `middlename` VARCHAR(50) NULL,
  `firstname` VARCHAR(50) NULL,
  `dateOfBirth` DATE NOT NULL,
  `gender` CHAR(1) NOT NULL DEFAULT 'M',
  `mobilephoneno` VARCHAR(20) NOT NULL,
  `residentialAddress` VARCHAR(300) NOT NULL,
  `countryOfResidence` VARCHAR(300) NOT NULL,
  `createdByUserId` INT NOT NULL,
  `investorReferralCode` VARCHAR(45) NULL,
  `Id` BIGINT NOT NULL AUTO_INCREMENT,
  `etlId` VARCHAR(255) NULL,
  `etlCreateTime` TIMESTAMP NULL COMMENT 'For those investors loaded from the ETL process we will insert the ID they had from the previous ERP database here',
  `creationApprovedByUserId` INT NULL,
  `creationApprovalDate` TIMESTAMP NULL,
  `recordStatus` INT NULL,
  `referrerId` INT NULL COMMENT 'References the Referrer table. The person that referred the investor',
  UNIQUE INDEX `etlId_UNIQUE` (`etlId` ASC),
  PRIMARY KEY (`Id`),
  INDEX `createdByUserId_idx` (`referrerId` ASC),
  CONSTRAINT `createdByUserId`
    FOREIGN KEY (`referrerId`)
    REFERENCES `Oak_Erp_DB`.`user` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `creationApprovedByUserId`
    FOREIGN KEY (`referrerId`)
    REFERENCES `Oak_Erp_DB`.`user` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Oak_Erp_DB`.`investmentplan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Oak_Erp_DB`.`investmentplan` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `defaultRate` DECIMAL(65,4) NOT NULL,
  `defaultTenor` INT NOT NULL,
  `defaultTenorUnit` CHAR(1) NOT NULL,
  `rateAppliesPerTenor` INT NOT NULL DEFAULT 2 COMMENT 'The profit rate applies every 2 (rateappliestenorunit), 4 etc. THat is profit is every 2 months etc\n',
  `rateAppliesPerTenorUnit` CHAR(1) NOT NULL DEFAULT 'M' COMMENT 'The profit rate applies every D(Day), M(month), W(Week), Y(Year)',
  `minimumInvestmentAmountInKobo` INT NOT NULL DEFAULT 10000000 COMMENT 'The minimum investment amount for this plan. This is expressed in kobo',
  `canTenorBeNegotiatedWithCustomer` CHAR(1) NOT NULL DEFAULT 'N' COMMENT 'Whether or not the tenor in the actual investment can be less than the investment default tenor.',
  `payOutRule` VARCHAR(45) NULL COMMENT 'Pay at maturity or pay each schedule entry. If pay at maturity, then each schedule entry will have status \"DEFERRED_TILL_MATURITY\" but if pay per schedule, then each schedule entry will read \"DUE\"',
  PRIMARY KEY (`id`))
COMMENT = 'Investment plans available in peaceful peace investment company\n';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Oak_Erp_DB`.`investment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Oak_Erp_DB`.`investment` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `investmentPlanId` INT NOT NULL,
  `investorId` BIGINT NOT NULL,
  `creationTimeStamp` TIMESTAMP NULL,
  `principalAmountInKobo` INT NOT NULL,
  `startDate` DATE NULL,
  `rate` DECIMAL(65,4) NULL,
  `tenor` INT NULL,
  `tenorUnit` CHAR(1) NULL COMMENT 'Either in days, months, weeks, years. i.e D, M, W, Y\n',
  `status` VARCHAR(45) NOT NULL DEFAULT 'ACTIVE',
  `maturityDate` DATE NULL,
  `actualMaturityDate` DATE NULL,
  `investmentAgreementSent` CHAR(1) NULL DEFAULT 'N',
  `investmentAgreementSentDate` DATE NULL,
  `relatedInvestmentId` BIGINT NULL COMMENT 'The related investment that gave rise to this one. A scenario is when an investment was rolled over at maturity. The original investments status is changed to expired and another investment is created with the ID of the original (now expired) one set as the relatedInvestmentId of the new investment.',
  PRIMARY KEY (`id`),
  INDEX `Id_idx` (`investorId` ASC),
  INDEX `Id_idx1` (`investmentPlanId` ASC), 
    FOREIGN KEY (`investorId`)
    REFERENCES `Oak_Erp_DB`.`investor` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`investmentPlanId`)
    REFERENCES `Oak_Erp_DB`.`investmentplan` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Oak_Erp_DB`.`paymentschedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Oak_Erp_DB`.`paymentschedule` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `amountInKobo` INT NOT NULL,
  `scheduledDate` DATE NOT NULL,
  `type` VARCHAR(45) NULL COMMENT 'Whether a PAYIN (that is, the investor paid a principal) or a PAYOUT(an interest payment)',
  `investmentId` BIGINT NOT NULL,
  `status` VARCHAR(45) NOT NULL COMMENT 'Paid|Missed|Canceled\n',
  PRIMARY KEY (`id`),
  INDEX `investmentId_idx` (`investmentId` ASC),
  CONSTRAINT `investmentId`
    FOREIGN KEY (`investmentId`)
    REFERENCES `Oak_Erp_DB`.`investment` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Oak_Erp_DB`.`investorbankinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Oak_Erp_DB`.`investorbankinfo` (
  `bankInfoId` BIGINT NOT NULL AUTO_INCREMENT,
  `bankName` VARCHAR(255) NOT NULL,
  `bankAccountNumber` VARCHAR(20) NOT NULL,
  `investorId` BIGINT NOT NULL,
  `status` VARCHAR(45) NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`bankInfoId`),
  INDEX `Id_idx` (`investorId` ASC),
  CONSTRAINT `Id`
    FOREIGN KEY (`investorId`)
    REFERENCES `Oak_Erp_DB`.`investor` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Oak_Erp_DB`.`paymententry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Oak_Erp_DB`.`paymententry` (
  `Id` BIGINT NOT NULL AUTO_INCREMENT,
  `narration` VARCHAR(2000) NOT NULL COMMENT 'A free-text description of the payment',
  `trackingRef` VARCHAR(2000) NULL COMMENT 'A reference ID to track the particular transaction. This reference may come from the channel that the transaction was processed through. For instance if it was a bank transfer, the teller number can be put in this field. If it\'s from a payment gateway, the transaction reference fromthe gateway can go in here.',
  `channel` VARCHAR(45) NULL COMMENT 'The means of this payment. Bank transfer, cash deposit, payment gateway etc',
  `fromAccount` VARCHAR(45) NOT NULL COMMENT 'The entity that was debited or doing the payment',
  `fromEntityType` VARCHAR(45) NOT NULL COMMENT 'The kind of entity the fromAccount field reference. e.g. Investor|Referrer|Internal_Account',
  `toAccount` VARCHAR(45) NOT NULL COMMENT 'The entity that was credited or received the payment',
  `toEntityType` VARCHAR(45) NOT NULL COMMENT 'The kind of entity the toAccount field references. Investor|Referrer|Internal_Account\netc\n',
  `bookingDate` DATETIME NULL COMMENT 'The system date and time that this payment entry was made.',
  `valueDate` DATETIME NULL COMMENT 'The date the entry should be recorded in an accounting sense.',
  `amountInKobo` INT NOT NULL COMMENT 'The amount in Kobo\n',
  `status` VARCHAR(45) NOT NULL DEFAULT 'PENDING' COMMENT 'Pending|Reversed|Active',
  `paymentType` VARCHAR(45) NOT NULL COMMENT 'What this payment was for. Investment|Referrer_Payment|schedule_payment|salary etc',
  PRIMARY KEY (`Id`));

SHOW WARNINGS;

