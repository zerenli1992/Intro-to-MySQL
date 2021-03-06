--
-- [AWI 10/5/16] THE OUTPUT BELOW WAS GENERATED BY RUNNING:
--		mysqldump --no-data COLAB > [PATH_TO_OUTPUT]/COLAB_WITHOUT_DATA.sql
--
-- MySQL dump 10.14  Distrib 5.5.50-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: COLAB
-- ------------------------------------------------------
-- Server version	5.5.50-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `LCL_characteristics`
--

DROP TABLE IF EXISTS `LCL_characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LCL_characteristics` (
  `LCL_ID` varchar(16) NOT NULL,
  `LCL_population` varchar(8) NOT NULL,
  `family_ID` varchar(16) NOT NULL,
  `paternal_LCL` varchar(16) NOT NULL,
  `maternal_LCL` varchar(16) NOT NULL,
  `sex` enum('M','F') NOT NULL,
  PRIMARY KEY (`LCL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LCL_genotypes`
--

DROP TABLE IF EXISTS `LCL_genotypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LCL_genotypes` (
  `IID` varchar(16) NOT NULL,
  `SNPpos` varchar(512) NOT NULL,
  `rsID` varchar(256) NOT NULL,
  `genotype` varchar(512) NOT NULL,
  PRIMARY KEY (`IID`,`SNPpos`),
  KEY `idx_rsID` (`rsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eQTL`
--

DROP TABLE IF EXISTS `eQTL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eQTL` (
  `rsID` varchar(256) NOT NULL,
  `eQTL` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gwas_results`
--

DROP TABLE IF EXISTS `gwas_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gwas_results` (
  `rsID` varchar(256) NOT NULL,
  `phenotype` varchar(128) NOT NULL,
  `study_population` varchar(8) NOT NULL,
  `EMPpvalue` double DEFAULT NULL,
  `beta` double DEFAULT NULL,
  PRIMARY KEY (`rsID`,`phenotype`,`study_population`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phenotypes`
--

DROP TABLE IF EXISTS `phenotypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phenotypes` (
  `LCL_ID` varchar(16) NOT NULL,
  `phenotype` varchar(128) NOT NULL,
  `phenotypic_value1` decimal(20,10) DEFAULT NULL,
  `phenotypic_value2` decimal(20,10) DEFAULT NULL,
  `phenotypic_value3` decimal(20,10) DEFAULT NULL,
  `phenotypic_mean` decimal(20,10) DEFAULT NULL,
  PRIMARY KEY (`LCL_ID`,`phenotype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snp`
--

DROP TABLE IF EXISTS `snp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snp` (
  `rsID` varchar(256) NOT NULL,
  `Chromosome` bigint(20) unsigned NOT NULL,
  `Position` int(10) unsigned NOT NULL,
  `Allele1` varchar(1024) NOT NULL,
  `Allele2` varchar(1024) NOT NULL,
  `DistanceToNearGene` varchar(1024) NOT NULL,
  `Gene` varchar(256) NOT NULL,
  `SNPtype` varchar(64) NOT NULL,
  PRIMARY KEY (`rsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-05 11:35:45
