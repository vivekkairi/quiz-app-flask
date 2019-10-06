-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: flask
-- ------------------------------------------------------
-- Server version	10.4.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `test_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qid` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `a` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `d` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ans` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marks` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES ('spry-hawk','1','#include <iostream>\nusing namespace std;\nint main()\n{\n   int a[2][4] = {3, 6, 9, 12, 15, 18, 21, 24};\n   cout << *(a[1] + 2) << *(*(a + 1) + 2) << 2[1[a]];\n   return 0;\n}','151821','212121','242424','Compile time error','B',1),('spry-hawk','2','void main()\n{\n    int m, i = 0, j = 1, k = 2;\n    m = i++ || j++ || k++;\n    printf(\"%d %d %d %d\", m, i, j, k);\n}','1 1 2 3','1 1 2 2','0 1 2 2','0 1 2 3','B',1),('spry-hawk','3','What is the return type of malloc() or calloc()','void *','int *','void **','Pointer of allocated memory location','A',1),('spry-hawk','4','Which of the following statement is correct?','The default value for an argument cannot be function call','C++ allows the redefinition of a default parameter','Both A and B','C++ does not allow the redefinition of a default parameter','D',1),('spry-hawk','5','Which of the following can be overloaded?','Objects','Functions ','Operators','Both B and C','D',1),('spry-hawk','6','Specify the 2 library functions to dynamically allocate memory?','malloc() and mealloc()','alloc() and mealloc()','malloc() and calloc()','memalloc() and faralloc()','C',1),('spry-hawk','7','Point out the error in the program\nstruct emp\n{\n	int ecode;\n	struct emp e;\n};','Error: in structure declaration','Linker error','No error','Run time error','A',1),('spry-hawk','8','#include <iostream>\nusing namespace std;\nint main()\n{\n	for (int i = 10; i > 6; i = i - 2)\n    	    cout << i;\n	for (int i = -5; i > -7; i--)\n    	    cout << i + 1;\n	return 0;\n}','1086- -6','108-4-5','108-5-6','86-4-5','B',1),('spry-hawk','9','Which member function is used to determine whether the stream object is currently associated with a file?','is_open','buf','string','none of the above','A',1),('spry-hawk','10','#include <iostream>\nusing namespace std;\n\nclass Test {\n    static int i;\n    int j;\n};\n\nint Test::i;\n\nint main() {\n    cout<<sizeof(Test);\n    return 0;\n}\nAssume size of int as 4 bytes','4','8','Compile Error','Run time Error','A',2),('spry-hawk','11','When can we have two classes with same name?','Not possible','In different files','Different namespace','Anywhere','C',1),('spry-hawk','12',' #include <iostream>\nusing namespace std;\n\nclass X {\npublic: X()\n    	{ cout<<\"X\"; }\n    	~X()\n    	{ cout<<\"~X\"; }\n};\nclass Y : public X {\npublic: Y()\n    	{ cout<<\"Y\"; }\n    	~Y()\n    	{ cout<<\"~Y\"; }\n};\nint main() {\n	Y obj;\n	return 0;\n}','XY~X~Y','XY~Y~X','X~XY~Y','X~X~YY','B',1),('spry-hawk','13','#include <stdio.h>\nint main()\n{\n	int a = 1, b = 2, c = 3;\n	char d = 0;\n	if (a, b, c, d) {\n    	printf(\"enter in the if\\n\");\n	}\n	printf(\"not enterd\\n\");\n	return 0;\n}','enter in the if','not entered','run time error','segmentation fault','B',2),('spry-hawk','14','#include <iostream>\nusing namespace std;\nint main()\n{\n cout<<\"Hello\";;;;;\n return 0;\n}','Compilation Error','Runtime Error','Hello','Hello;;;;','C',1),('spry-hawk','15','The two statements that can be used to change the flow of control are ________','if and while','if and switch','switch and do-while','break and continue','B',1),('spry-hawk','16','If p and q are assigned values 2 and 3 respectively then the statement p=q++','Gives an error message','Assigns a value 4 to p','Assigns a value 3 to p','Assigns a value 5 to p','C',1),('spry-hawk','17','#include <iostream>\nusing namespace std;\nint main()\n{\n	int i, x[5], y, z[5];\n	for (i = 0; i < 5; i++) {\n    	    x[i] = i;\n    	    z[i] = i + 3;\n    	    y = z[i];\n    	    x[i] = y++;\n	}\n	for (i = 0; i < 5; i++)\n    	    cout << x[i] << \" \";\n	return 0;\n}','3 4 5 6 7','4 5 6 7 8','2 3 4 5 6','none of above','A',2),('spry-hawk','18','#include <stdio.h>\n#define square(x) (x * x)\n\nint main()\n{\n	int x, y = 1;\n	x = square(y + 1);\n	printf(\"%d\\n\", x);\n	return 0;\n}\n','Error','4','3','Garbage Value','C',1),('spry-hawk','19','If a variable is a pointer to a structure, then which of the following operator is used to access data members of the structure through the pointer variable?','.','*','&','->','D',1),('spry-hawk','20','#include <stdio.h>\nint main()\n{\n	int i=3, *j, k;\n	j = &i;\n	printf(“%d\\n”, i**j*i+*j);\n	return 0;\n}','30','27','9','3','A',1),('spry-hawk','21','For automatic objects, constructors and destructors are called each time the objects','Enter and leave scope','Inherit parent class','Are Constructed','Are destroyed','A',1),('spry-hawk','22','#include <iostream>\nusing namespace std;\nint n(char, int);\nint (*p) (char, int) = n;\nint main()\n{\n	(*p)(\'d\', 9);\n	p(10, 9);\n	return 0;\n}\n\nint n(char c, int i)\n{\n	cout << c <<  i;\n	return 0;\n}','d9\n9','d9d9','d9','d9109','A',2),('spry-hawk','23','void main()\n{\n	int a = 1;\n	switch(a)\n	{\n    	case 1: cout<<\"One\";\n    	case 2: cout<<\"Two\";\n    	case 3: cout<<\"Three\";\n    	default: cout<<\"Default\";\n	}\n\n}','One','OneTwoThree','Default','OneTwoThreeDefault','D',1),('spry-hawk','24','#include <stdio.h>\nint main()\n{\n	int val = 1;\n\n	do {\n    	    val++;\n    	    ++val;\n	} while (val++ > 25);\n	printf(\"%d\\n\", val);\n	return 0;\n}','25','3','4','26','C',1),('spry-hawk','25','#include <stdio.h>\nvoid main()\n{\n	printf(6 + \"Geeks for Geeks\");\n}','6Geeks for Geeks','Geeks for Geeks','for Geeks','Compile time error','C',2),('ambrosial-sloth','1','#include <iostream>\nusing namespace std;\nint main()\n{\n   int a[2][4] = {3, 6, 9, 12, 15, 18, 21, 24};\n   cout << *(a[1] + 2) << *(*(a + 1) + 2) << 2[1[a]];\n   return 0;\n}','151821','212121','242424','Compile time error','B',1),('ambrosial-sloth','2','void main()\n{\n    int m, i = 0, j = 1, k = 2;\n    m = i++ || j++ || k++;\n    printf(\"%d %d %d %d\", m, i, j, k);\n}','1 1 2 3','1 1 2 2','0 1 2 2','0 1 2 3','B',1),('ambrosial-sloth','3','What is the return type of malloc() or calloc()','void *','int *','void **','Pointer of allocated memory location','A',1),('ambrosial-sloth','4','Which of the following statement is correct?','The default value for an argument cannot be function call','C++ allows the redefinition of a default parameter','Both A and B','C++ does not allow the redefinition of a default parameter','D',1),('ambrosial-sloth','5','Which of the following can be overloaded?','Objects','Functions ','Operators','Both B and C','D',1),('ambrosial-sloth','6','Specify the 2 library functions to dynamically allocate memory?','malloc() and mealloc()','alloc() and mealloc()','malloc() and calloc()','memalloc() and faralloc()','C',1),('ambrosial-sloth','7','Point out the error in the program\nstruct emp\n{\n	int ecode;\n	struct emp e;\n};','Error: in structure declaration','Linker error','No error','Run time error','A',1),('ambrosial-sloth','8','#include <iostream>\nusing namespace std;\nint main()\n{\n	for (int i = 10; i > 6; i = i - 2)\n    	    cout << i;\n	for (int i = -5; i > -7; i--)\n    	    cout << i + 1;\n	return 0;\n}','1086- -6','108-4-5','108-5-6','86-4-5','B',1),('ambrosial-sloth','9','Which member function is used to determine whether the stream object is currently associated with a file?','is_open','buf','string','none of the above','A',1),('ambrosial-sloth','10','#include <iostream>\nusing namespace std;\n\nclass Test {\n    static int i;\n    int j;\n};\n\nint Test::i;\n\nint main() {\n    cout<<sizeof(Test);\n    return 0;\n}\nAssume size of int as 4 bytes','4','8','Compile Error','Run time Error','A',2),('ambrosial-sloth','11','When can we have two classes with same name?','Not possible','In different files','Different namespace','Anywhere','C',1),('ambrosial-sloth','12',' #include <iostream>\nusing namespace std;\n\nclass X {\npublic: X()\n    	{ cout<<\"X\"; }\n    	~X()\n    	{ cout<<\"~X\"; }\n};\nclass Y : public X {\npublic: Y()\n    	{ cout<<\"Y\"; }\n    	~Y()\n    	{ cout<<\"~Y\"; }\n};\nint main() {\n	Y obj;\n	return 0;\n}','XY~X~Y','XY~Y~X','X~XY~Y','X~X~YY','B',1),('ambrosial-sloth','13','#include <stdio.h>\nint main()\n{\n	int a = 1, b = 2, c = 3;\n	char d = 0;\n	if (a, b, c, d) {\n    	printf(\"enter in the if\\n\");\n	}\n	printf(\"not enterd\\n\");\n	return 0;\n}','enter in the if','not entered','run time error','segmentation fault','B',2),('ambrosial-sloth','14','#include <iostream>\nusing namespace std;\nint main()\n{\n cout<<\"Hello\";;;;;\n return 0;\n}','Compilation Error','Runtime Error','Hello','Hello;;;;','C',1),('ambrosial-sloth','15','The two statements that can be used to change the flow of control are ________','if and while','if and switch','switch and do-while','break and continue','B',1),('ambrosial-sloth','16','If p and q are assigned values 2 and 3 respectively then the statement p=q++','Gives an error message','Assigns a value 4 to p','Assigns a value 3 to p','Assigns a value 5 to p','C',1),('ambrosial-sloth','17','#include <iostream>\nusing namespace std;\nint main()\n{\n	int i, x[5], y, z[5];\n	for (i = 0; i < 5; i++) {\n    	    x[i] = i;\n    	    z[i] = i + 3;\n    	    y = z[i];\n    	    x[i] = y++;\n	}\n	for (i = 0; i < 5; i++)\n    	    cout << x[i] << \" \";\n	return 0;\n}','3 4 5 6 7','4 5 6 7 8','2 3 4 5 6','none of above','A',2),('ambrosial-sloth','18','#include <stdio.h>\n#define square(x) (x * x)\n\nint main()\n{\n	int x, y = 1;\n	x = square(y + 1);\n	printf(\"%d\\n\", x);\n	return 0;\n}\n','Error','4','3','Garbage Value','C',1),('ambrosial-sloth','19','If a variable is a pointer to a structure, then which of the following operator is used to access data members of the structure through the pointer variable?','.','*','&','->','D',1),('ambrosial-sloth','20','#include <stdio.h>\nint main()\n{\n	int i=3, *j, k;\n	j = &i;\n	printf(“%d\\n”, i**j*i+*j);\n	return 0;\n}','30','27','9','3','A',1),('ambrosial-sloth','21','For automatic objects, constructors and destructors are called each time the objects','Enter and leave scope','Inherit parent class','Are Constructed','Are destroyed','A',1),('ambrosial-sloth','22','#include <iostream>\nusing namespace std;\nint n(char, int);\nint (*p) (char, int) = n;\nint main()\n{\n	(*p)(\'d\', 9);\n	p(10, 9);\n	return 0;\n}\n\nint n(char c, int i)\n{\n	cout << c <<  i;\n	return 0;\n}','d9\n9','d9d9','d9','d9109','A',2),('ambrosial-sloth','23','void main()\n{\n	int a = 1;\n	switch(a)\n	{\n    	case 1: cout<<\"One\";\n    	case 2: cout<<\"Two\";\n    	case 3: cout<<\"Three\";\n    	default: cout<<\"Default\";\n	}\n\n}','One','OneTwoThree','Default','OneTwoThreeDefault','D',1),('ambrosial-sloth','24','#include <stdio.h>\nint main()\n{\n	int val = 1;\n\n	do {\n    	    val++;\n    	    ++val;\n	} while (val++ > 25);\n	printf(\"%d\\n\", val);\n	return 0;\n}','25','3','4','26','C',1),('ambrosial-sloth','25','#include <stdio.h>\nvoid main()\n{\n	printf(6 + \"Geeks for Geeks\");\n}','6Geeks for Geeks','Geeks for Geeks','for Geeks','Compile time error','C',2),('aquamarine-eagle','1','#include <iostream>\nusing namespace std;\nint main()\n{\n   int a[2][4] = {3, 6, 9, 12, 15, 18, 21, 24};\n   cout << *(a[1] + 2) << *(*(a + 1) + 2) << 2[1[a]];\n   return 0;\n}','151821','212121','242424','Compile time error','B',1),('aquamarine-eagle','2','void main()\n{\n    int m, i = 0, j = 1, k = 2;\n    m = i++ || j++ || k++;\n    printf(\"%d %d %d %d\", m, i, j, k);\n}','1 1 2 3','1 1 2 2','0 1 2 2','0 1 2 3','B',1),('aquamarine-eagle','3','What is the return type of malloc() or calloc()','void *','int *','void **','Pointer of allocated memory location','A',1),('aquamarine-eagle','4','Which of the following statement is correct?','The default value for an argument cannot be function call','C++ allows the redefinition of a default parameter','Both A and B','C++ does not allow the redefinition of a default parameter','D',1),('aquamarine-eagle','5','Which of the following can be overloaded?','Objects','Functions ','Operators','Both B and C','D',1),('aquamarine-eagle','6','Specify the 2 library functions to dynamically allocate memory?','malloc() and mealloc()','alloc() and mealloc()','malloc() and calloc()','memalloc() and faralloc()','C',1),('aquamarine-eagle','7','Point out the error in the program\nstruct emp\n{\n	int ecode;\n	struct emp e;\n};','Error: in structure declaration','Linker error','No error','Run time error','A',1),('aquamarine-eagle','8','#include <iostream>\nusing namespace std;\nint main()\n{\n	for (int i = 10; i > 6; i = i - 2)\n    	    cout << i;\n	for (int i = -5; i > -7; i--)\n    	    cout << i + 1;\n	return 0;\n}','1086- -6','108-4-5','108-5-6','86-4-5','B',1),('aquamarine-eagle','9','Which member function is used to determine whether the stream object is currently associated with a file?','is_open','buf','string','none of the above','A',1),('aquamarine-eagle','10','#include <iostream>\nusing namespace std;\n\nclass Test {\n    static int i;\n    int j;\n};\n\nint Test::i;\n\nint main() {\n    cout<<sizeof(Test);\n    return 0;\n}\nAssume size of int as 4 bytes','4','8','Compile Error','Run time Error','A',2),('aquamarine-eagle','11','When can we have two classes with same name?','Not possible','In different files','Different namespace','Anywhere','C',1),('aquamarine-eagle','12',' #include <iostream>\nusing namespace std;\n\nclass X {\npublic: X()\n    	{ cout<<\"X\"; }\n    	~X()\n    	{ cout<<\"~X\"; }\n};\nclass Y : public X {\npublic: Y()\n    	{ cout<<\"Y\"; }\n    	~Y()\n    	{ cout<<\"~Y\"; }\n};\nint main() {\n	Y obj;\n	return 0;\n}','XY~X~Y','XY~Y~X','X~XY~Y','X~X~YY','B',1),('aquamarine-eagle','13','#include <stdio.h>\nint main()\n{\n	int a = 1, b = 2, c = 3;\n	char d = 0;\n	if (a, b, c, d) {\n    	printf(\"enter in the if\\n\");\n	}\n	printf(\"not enterd\\n\");\n	return 0;\n}','enter in the if','not entered','run time error','segmentation fault','B',2),('aquamarine-eagle','14','#include <iostream>\nusing namespace std;\nint main()\n{\n cout<<\"Hello\";;;;;\n return 0;\n}','Compilation Error','Runtime Error','Hello','Hello;;;;','C',1),('aquamarine-eagle','15','The two statements that can be used to change the flow of control are ________','if and while','if and switch','switch and do-while','break and continue','B',1),('aquamarine-eagle','16','If p and q are assigned values 2 and 3 respectively then the statement p=q++','Gives an error message','Assigns a value 4 to p','Assigns a value 3 to p','Assigns a value 5 to p','C',1),('aquamarine-eagle','17','#include <iostream>\nusing namespace std;\nint main()\n{\n	int i, x[5], y, z[5];\n	for (i = 0; i < 5; i++) {\n    	    x[i] = i;\n    	    z[i] = i + 3;\n    	    y = z[i];\n    	    x[i] = y++;\n	}\n	for (i = 0; i < 5; i++)\n    	    cout << x[i] << \" \";\n	return 0;\n}','3 4 5 6 7','4 5 6 7 8','2 3 4 5 6','none of above','A',2),('aquamarine-eagle','18','#include <stdio.h>\n#define square(x) (x * x)\n\nint main()\n{\n	int x, y = 1;\n	x = square(y + 1);\n	printf(\"%d\\n\", x);\n	return 0;\n}\n','Error','4','3','Garbage Value','C',1),('aquamarine-eagle','19','If a variable is a pointer to a structure, then which of the following operator is used to access data members of the structure through the pointer variable?','.','*','&','->','D',1),('aquamarine-eagle','20','#include <stdio.h>\nint main()\n{\n	int i=3, *j, k;\n	j = &i;\n	printf(“%d\\n”, i**j*i+*j);\n	return 0;\n}','30','27','9','3','A',1),('aquamarine-eagle','21','For automatic objects, constructors and destructors are called each time the objects','Enter and leave scope','Inherit parent class','Are Constructed','Are destroyed','A',1),('aquamarine-eagle','22','#include <iostream>\nusing namespace std;\nint n(char, int);\nint (*p) (char, int) = n;\nint main()\n{\n	(*p)(\'d\', 9);\n	p(10, 9);\n	return 0;\n}\n\nint n(char c, int i)\n{\n	cout << c <<  i;\n	return 0;\n}','d9\n9','d9d9','d9','d9109','A',2),('aquamarine-eagle','23','void main()\n{\n	int a = 1;\n	switch(a)\n	{\n    	case 1: cout<<\"One\";\n    	case 2: cout<<\"Two\";\n    	case 3: cout<<\"Three\";\n    	default: cout<<\"Default\";\n	}\n\n}','One','OneTwoThree','Default','OneTwoThreeDefault','D',1),('aquamarine-eagle','24','#include <stdio.h>\nint main()\n{\n	int val = 1;\n\n	do {\n    	    val++;\n    	    ++val;\n	} while (val++ > 25);\n	printf(\"%d\\n\", val);\n	return 0;\n}','25','3','4','26','C',1),('aquamarine-eagle','25','#include <stdio.h>\nvoid main()\n{\n	printf(6 + \"Geeks for Geeks\");\n}','6Geeks for Geeks','Geeks for Geeks','for Geeks','Compile time error','C',2);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentTestInfo`
--

DROP TABLE IF EXISTS `studentTestInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentTestInfo` (
  `username` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_left` time DEFAULT NULL,
  `completed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentTestInfo`
--

LOCK TABLES `studentTestInfo` WRITE;
/*!40000 ALTER TABLE `studentTestInfo` DISABLE KEYS */;
INSERT INTO `studentTestInfo` VALUES ('vivek','aquamarine-eagle','00:00:00',1);
/*!40000 ALTER TABLE `studentTestInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `username` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qid` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ans` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('vivek','aquamarine-eagle','0','c'),('vivek','aquamarine-eagle','1','d'),('vivek','aquamarine-eagle','2','c'),('vivek','aquamarine-eagle','3','d'),('vivek','aquamarine-eagle','18','d'),('vivek','aquamarine-eagle','11','d'),('vivek','aquamarine-eagle','13','b');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `username` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `duration` int(3) DEFAULT NULL,
  `show_ans` int(1) DEFAULT NULL,
  `password` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES ('vivek','aquamarine-eagle','2019-10-02 10:23:58','2019-02-09 18:30:00',100,1,'qwe');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `register_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `confirmed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'vivek','Vivek Kairi','vivekkairi30oct@gmail.com','$5$rounds=535000$k6CK1jyuQvXoQbiq$EYu6RxiPoDuNNRrmolwg1NpcA32NkP.dSnPr5a8dTg7','2019-10-04 13:11:46',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-04 23:14:59
