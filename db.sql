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
  `marks` int(1) DEFAULT NULL,
  `explanation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES ('industrious-turtle','1','Which of the following escape sequence represents carriage return?','\\r','\\c','\\n\\r','None of the above','A',1,''),('industrious-turtle','2','Input: 1\n#include <stdio.h>\nint main()\n{\n	register int i, x;\n	scanf(\"%d\", &i);\n	x = ++i;\n	printf(\"%d\", x);\n	return 0;\n}','0','1','2','Compiler Error','D',2,''),('industrious-turtle','3','#include <iostream>\nusing namespace std;\n#include <iostream>\nusing namespace std;\nint main() {\n	int i, x[5], y, z[5];\n	for (i = 0; i < 5; i++) {\n    	     x[i] = i;\n    	     z[i] = i + 3;\n    	     y = z[i];\n    	     x[i] = y++;\n	}\n	for (i = 0; i < 5; i++)\n    	    cout << x[i] << \" \";\n	return 0;\n}','3 4 5 6 7','4 5 6 7 8','2 3 4 5 6',' none of above\n','A',2,''),('industrious-turtle','4','#include <stdio.h>\n#define square(x) (x * x)\n\nint main()\n{\n	int x, y = 3;\n	x = square(y + 1);\n	printf(\"%d\\n\", x);\n	return 0;\n}','Error','16','7','Garbage','',1,''),('industrious-turtle','5','#include <iostream>\nusing namespace std;\nint main()\n{\n	char* str = \"HelloWorld\";\n	int* p, arr[] = { 10, 15, 70, 19 };\n	p = arr;\n	str++;\n	p++;\n	cout << *p << \" \" << str << endl;\n	return 0;\n}','10 elloWorld','15 HelloWorld','15 elloWorld','10 HelloWorld','C',1,''),('industrious-turtle','6','#include <stdio.h>\nvoid main()\n{\n	unsigned char x = 350;\n	printf(\"%d\", x);\n}','Error','94','350','Garbage Value','B',1,''),('industrious-turtle','7','#include <stdio.h>\nint main(void)\n{\n    int y, z;\n    int x = scanf(\"%d %d\", &y, &z);\n    printf(\"%d\", x);\n    return 0;\n}\nInput: 12 10','12','2','Syntax error','10','B',2,''),('industrious-turtle','8','void main()\n{\n    int const* p = 5;\n    printf(\"%d\", ++(*p));\n}\n','6','5','Garbage Value','Compiler Error','D',1,''),('industrious-turtle','9','What is the general syntax for accessing the namespace variable?','namespace::operator','namespace:operator','namespace->operator','none of the mentioned','A',1,''),('industrious-turtle','10',' A constructor that accept _____ parameters is called the default constructor.','0','1','2','3','A',1,''),('industrious-turtle','11','#include <iostream>\nusing namespace std;\nint main()\n{\n	for (int i = 14; i > 8; i = i - 2)\n    	    cout << i;\n	for (int i = -5; i > -7; i--)\n    	    cout << i + 1;\n	return 0;\n}','141210-4-5','141210-4','1412-4-5','141210-4','A',1,''),('industrious-turtle','12','#include\"stdio.h\"\n#include\"stdlib.h\"\nvoid reverse(int i)\n{\n    if (i > 5)\n         exit(0);\n     printf(\"%d\\n\", i);\n     return reverse(i++);\n}\nint main()\n{\n    reverse(1);\n}\n','Segmenation fault','Compilation error','Print 1 Infinite time','Both a & c','D',1,''),('industrious-turtle','13','The number of relational operators in the C language is','4','6','3','1','B',1,''),('industrious-turtle','14','# include <stdio.h>\nvoid fun(int *ptr)\n{\n    *ptr = 30;\n}\n \nint main()\n{\n  int y = 20;\n  fun(&y);\n  printf(\"%d\", y);\n \n  return 0;\n}','20','30','Compile Error','Runtime Error','',1,''),('industrious-turtle','15',' In CPP, cin and cout are the predefined stream __________ .','Operator','Functions','Objects','Data types','C',1,''),('industrious-turtle','16','\n#include <stdio.h>\nint main()\n{\n	int ***r, **q, *p, i=8;\n	p = &i;\n	q = &p;\n	r = &q;\n	printf(“%d, %d, %d\\n”, *p, **q, ***r);\n	return 0;\n}\n\n','8, 8, 8','4000, 4002, 4004','4000, 4004, 4008','4000,4000, 4000','A',1,''),('groovy-uakari','1','#include <iostream>\nusing namespace std;\nint main()\n{\n   int a[2][4] = {3, 6, 9, 12, 15, 18, 21, 24};\n   cout << *(a[1] + 2) << *(*(a + 1) + 2) << 2[1[a]];\n   return 0;\n}','151821','212121','242424','Compile time error','B',1,''),('groovy-uakari','2','void main()\n{\n    int m, i = 0, j = 1, k = 2;\n    m = i++ || j++ || k++;\n    printf(\"%d %d %d %d\", m, i, j, k);\n}','1 1 2 3','1 1 2 2','0 1 2 2','0 1 2 3','B',1,''),('groovy-uakari','3','What is the return type of malloc() or calloc()','void *','int *','void **','Pointer of allocated memory location','A',1,''),('groovy-uakari','4','Which of the following statement is correct?','The default value for an argument cannot be function call','C++ allows the redefinition of a default parameter','Both A and B','C++ does not allow the redefinition of a default parameter','D',1,''),('groovy-uakari','5','Which of the following can be overloaded?','Objects','Functions ','Operators','Both B and C','D',1,''),('groovy-uakari','6','Specify the 2 library functions to dynamically allocate memory?','malloc() and mealloc()','alloc() and mealloc()','malloc() and calloc()','memalloc() and faralloc()','C',1,''),('groovy-uakari','7','Point out the error in the program\nstruct emp\n{\n	int ecode;\n	struct emp e;\n};','Error: in structure declaration','Linker error','No error','Run time error','A',1,''),('groovy-uakari','8','#include <iostream>\nusing namespace std;\nint main()\n{\n	for (int i = 10; i > 6; i = i - 2)\n    	    cout << i;\n	for (int i = -5; i > -7; i--)\n    	    cout << i + 1;\n	return 0;\n}','1086- -6','108-4-5','108-5-6','86-4-5','B',1,''),('groovy-uakari','9','Which member function is used to determine whether the stream object is currently associated with a file?','is_open','buf','string','none of the above','A',1,''),('groovy-uakari','10','#include <iostream>\nusing namespace std;\n\nclass Test {\n    static int i;\n    int j;\n};\n\nint Test::i;\n\nint main() {\n    cout<<sizeof(Test);\n    return 0;\n}\nAssume size of int as 4 bytes','4','8','Compile Error','Run time Error','A',2,''),('groovy-uakari','11','When can we have two classes with same name?','Not possible','In different files','Different namespace','Anywhere','C',1,''),('groovy-uakari','12',' #include <iostream>\nusing namespace std;\n\nclass X {\npublic: X()\n    	{ cout<<\"X\"; }\n    	~X()\n    	{ cout<<\"~X\"; }\n};\nclass Y : public X {\npublic: Y()\n    	{ cout<<\"Y\"; }\n    	~Y()\n    	{ cout<<\"~Y\"; }\n};\nint main() {\n	Y obj;\n	return 0;\n}','XY~X~Y','XY~Y~X','X~XY~Y','X~X~YY','B',1,''),('groovy-uakari','13','#include <stdio.h>\nint main()\n{\n	int a = 1, b = 2, c = 3;\n	char d = 0;\n	if (a, b, c, d) {\n    	printf(\"enter in the if\\n\");\n	}\n	printf(\"not enterd\\n\");\n	return 0;\n}','enter in the if','not entered','run time error','segmentation fault','B',2,''),('groovy-uakari','14','#include <iostream>\nusing namespace std;\nint main()\n{\n cout<<\"Hello\";;;;;\n return 0;\n}','Compilation Error','Runtime Error','Hello','Hello;;;;','C',1,''),('groovy-uakari','15','The two statements that can be used to change the flow of control are ________','if and while','if and switch','switch and do-while','break and continue','B',1,''),('groovy-uakari','16','If p and q are assigned values 2 and 3 respectively then the statement p=q++','Gives an error message','Assigns a value 4 to p','Assigns a value 3 to p','Assigns a value 5 to p','C',1,''),('groovy-uakari','17','#include <iostream>\nusing namespace std;\nint main()\n{\n	int i, x[5], y, z[5];\n	for (i = 0; i < 5; i++) {\n    	    x[i] = i;\n    	    z[i] = i + 3;\n    	    y = z[i];\n    	    x[i] = y++;\n	}\n	for (i = 0; i < 5; i++)\n    	    cout << x[i] << \" \";\n	return 0;\n}','3 4 5 6 7','4 5 6 7 8','2 3 4 5 6','none of above','A',2,''),('groovy-uakari','18','#include <stdio.h>\n#define square(x) (x * x)\n\nint main()\n{\n	int x, y = 1;\n	x = square(y + 1);\n	printf(\"%d\\n\", x);\n	return 0;\n}\n','Error','4','3','Garbage Value','C',1,''),('groovy-uakari','19','If a variable is a pointer to a structure, then which of the following operator is used to access data members of the structure through the pointer variable?','.','*','&','->','D',1,''),('groovy-uakari','20','#include <stdio.h>\nint main()\n{\n	int i=3, *j, k;\n	j = &i;\n	printf(“%d\\n”, i**j*i+*j);\n	return 0;\n}','30','27','9','3','A',1,''),('groovy-uakari','21','For automatic objects, constructors and destructors are called each time the objects','Enter and leave scope','Inherit parent class','Are Constructed','Are destroyed','A',1,''),('groovy-uakari','22','#include <iostream>\nusing namespace std;\nint n(char, int);\nint (*p) (char, int) = n;\nint main()\n{\n	(*p)(\'d\', 9);\n	p(10, 9);\n	return 0;\n}\n\nint n(char c, int i)\n{\n	cout << c <<  i;\n	return 0;\n}','d9\n9','d9d9','d9','d9109','A',2,''),('groovy-uakari','23','void main()\n{\n	int a = 1;\n	switch(a)\n	{\n    	case 1: cout<<\"One\";\n    	case 2: cout<<\"Two\";\n    	case 3: cout<<\"Three\";\n    	default: cout<<\"Default\";\n	}\n\n}','One','OneTwoThree','Default','OneTwoThreeDefault','D',1,''),('groovy-uakari','24','#include <stdio.h>\nint main()\n{\n	int val = 1;\n\n	do {\n    	    val++;\n    	    ++val;\n	} while (val++ > 25);\n	printf(\"%d\\n\", val);\n	return 0;\n}','25','3','4','26','C',1,''),('groovy-uakari','25','#include <stdio.h>\nvoid main()\n{\n	printf(6 + \"Geeks for Geeks\");\n}','6Geeks for Geeks','Geeks for Geeks','for Geeks','Compile time error','C',2,''),('topaz-caterpillar','1','#include <iostream>\nusing namespace std;\nint main()\n{\n   int a[2][4] = {3, 6, 9, 12, 15, 18, 21, 24};\n   cout << *(a[1] + 2) << *(*(a + 1) + 2) << 2[1[a]];\n   return 0;\n}','151821','212121','242424','Compile time error','B',1,''),('topaz-caterpillar','2','void main()\n{\n    int m, i = 0, j = 1, k = 2;\n    m = i++ || j++ || k++;\n    printf(\"%d %d %d %d\", m, i, j, k);\n}','1 1 2 3','1 1 2 2','0 1 2 2','0 1 2 3','B',1,''),('topaz-caterpillar','3','What is the return type of malloc() or calloc()','void *','int *','void **','Pointer of allocated memory location','A',1,''),('topaz-caterpillar','4','Which of the following statement is correct?','The default value for an argument cannot be function call','C++ allows the redefinition of a default parameter','Both A and B','C++ does not allow the redefinition of a default parameter','D',1,''),('topaz-caterpillar','5','Which of the following can be overloaded?','Objects','Functions ','Operators','Both B and C','D',1,''),('topaz-caterpillar','6','Specify the 2 library functions to dynamically allocate memory?','malloc() and mealloc()','alloc() and mealloc()','malloc() and calloc()','memalloc() and faralloc()','C',1,''),('topaz-caterpillar','7','Point out the error in the program\nstruct emp\n{\n	int ecode;\n	struct emp e;\n};','Error: in structure declaration','Linker error','No error','Run time error','A',1,''),('topaz-caterpillar','8','#include <iostream>\nusing namespace std;\nint main()\n{\n	for (int i = 10; i > 6; i = i - 2)\n    	    cout << i;\n	for (int i = -5; i > -7; i--)\n    	    cout << i + 1;\n	return 0;\n}','1086- -6','108-4-5','108-5-6','86-4-5','B',1,''),('topaz-caterpillar','9','Which member function is used to determine whether the stream object is currently associated with a file?','is_open','buf','string','none of the above','A',1,''),('topaz-caterpillar','10','#include <iostream>\nusing namespace std;\n\nclass Test {\n    static int i;\n    int j;\n};\n\nint Test::i;\n\nint main() {\n    cout<<sizeof(Test);\n    return 0;\n}\nAssume size of int as 4 bytes','4','8','Compile Error','Run time Error','A',2,''),('topaz-caterpillar','11','When can we have two classes with same name?','Not possible','In different files','Different namespace','Anywhere','C',1,''),('topaz-caterpillar','12',' #include <iostream>\nusing namespace std;\n\nclass X {\npublic: X()\n    	{ cout<<\"X\"; }\n    	~X()\n    	{ cout<<\"~X\"; }\n};\nclass Y : public X {\npublic: Y()\n    	{ cout<<\"Y\"; }\n    	~Y()\n    	{ cout<<\"~Y\"; }\n};\nint main() {\n	Y obj;\n	return 0;\n}','XY~X~Y','XY~Y~X','X~XY~Y','X~X~YY','B',1,''),('topaz-caterpillar','13','#include <stdio.h>\nint main()\n{\n	int a = 1, b = 2, c = 3;\n	char d = 0;\n	if (a, b, c, d) {\n    	printf(\"enter in the if\\n\");\n	}\n	printf(\"not enterd\\n\");\n	return 0;\n}','enter in the if','not entered','run time error','segmentation fault','B',2,''),('topaz-caterpillar','14','#include <iostream>\nusing namespace std;\nint main()\n{\n cout<<\"Hello\";;;;;\n return 0;\n}','Compilation Error','Runtime Error','Hello','Hello;;;;','C',1,''),('topaz-caterpillar','15','The two statements that can be used to change the flow of control are ________','if and while','if and switch','switch and do-while','break and continue','B',1,''),('topaz-caterpillar','16','If p and q are assigned values 2 and 3 respectively then the statement p=q++','Gives an error message','Assigns a value 4 to p','Assigns a value 3 to p','Assigns a value 5 to p','C',1,''),('topaz-caterpillar','17','#include <iostream>\nusing namespace std;\nint main()\n{\n	int i, x[5], y, z[5];\n	for (i = 0; i < 5; i++) {\n    	    x[i] = i;\n    	    z[i] = i + 3;\n    	    y = z[i];\n    	    x[i] = y++;\n	}\n	for (i = 0; i < 5; i++)\n    	    cout << x[i] << \" \";\n	return 0;\n}','3 4 5 6 7','4 5 6 7 8','2 3 4 5 6','none of above','A',2,''),('topaz-caterpillar','18','#include <stdio.h>\n#define square(x) (x * x)\n\nint main()\n{\n	int x, y = 1;\n	x = square(y + 1);\n	printf(\"%d\\n\", x);\n	return 0;\n}\n','Error','4','3','Garbage Value','C',1,''),('topaz-caterpillar','19','If a variable is a pointer to a structure, then which of the following operator is used to access data members of the structure through the pointer variable?','.','*','&','->','D',1,''),('topaz-caterpillar','20','#include <stdio.h>\nint main()\n{\n	int i=3, *j, k;\n	j = &i;\n	printf(“%d\\n”, i**j*i+*j);\n	return 0;\n}','30','27','9','3','A',1,''),('topaz-caterpillar','21','For automatic objects, constructors and destructors are called each time the objects','Enter and leave scope','Inherit parent class','Are Constructed','Are destroyed','A',1,''),('topaz-caterpillar','22','#include <iostream>\nusing namespace std;\nint n(char, int);\nint (*p) (char, int) = n;\nint main()\n{\n	(*p)(\'d\', 9);\n	p(10, 9);\n	return 0;\n}\n\nint n(char c, int i)\n{\n	cout << c <<  i;\n	return 0;\n}','d9\n9','d9d9','d9','d9109','A',2,''),('topaz-caterpillar','23','void main()\n{\n	int a = 1;\n	switch(a)\n	{\n    	case 1: cout<<\"One\";\n    	case 2: cout<<\"Two\";\n    	case 3: cout<<\"Three\";\n    	default: cout<<\"Default\";\n	}\n\n}','One','OneTwoThree','Default','OneTwoThreeDefault','D',1,''),('topaz-caterpillar','24','#include <stdio.h>\nint main()\n{\n	int val = 1;\n\n	do {\n    	    val++;\n    	    ++val;\n	} while (val++ > 25);\n	printf(\"%d\\n\", val);\n	return 0;\n}','25','3','4','26','C',1,''),('topaz-caterpillar','25','#include <stdio.h>\nvoid main()\n{\n	printf(6 + \"Geeks for Geeks\");\n}','6Geeks for Geeks','Geeks for Geeks','for Geeks','Compile time error','C',2,''),('spotted-caracal','1','#include <iostream>\nusing namespace std;\nint main()\n{\n   int a[2][4] = {3, 6, 9, 12, 15, 18, 21, 24};\n   cout << *(a[1] + 2) << *(*(a + 1) + 2) << 2[1[a]];\n   return 0;\n}','151821','212121','242424','Compile time error','B',1,''),('spotted-caracal','2','void main()\n{\n    int m, i = 0, j = 1, k = 2;\n    m = i++ || j++ || k++;\n    printf(\"%d %d %d %d\", m, i, j, k);\n}','1 1 2 3','1 1 2 2','0 1 2 2','0 1 2 3','B',1,''),('spotted-caracal','3','What is the return type of malloc() or calloc()','void *','int *','void **','Pointer of allocated memory location','A',1,''),('spotted-caracal','4','Which of the following statement is correct?','The default value for an argument cannot be function call','C++ allows the redefinition of a default parameter','Both A and B','C++ does not allow the redefinition of a default parameter','D',1,''),('spotted-caracal','5','Which of the following can be overloaded?','Objects','Functions ','Operators','Both B and C','D',1,''),('spotted-caracal','6','Specify the 2 library functions to dynamically allocate memory?','malloc() and mealloc()','alloc() and mealloc()','malloc() and calloc()','memalloc() and faralloc()','C',1,''),('spotted-caracal','7','Point out the error in the program\nstruct emp\n{\n	int ecode;\n	struct emp e;\n};','Error: in structure declaration','Linker error','No error','Run time error','A',1,''),('spotted-caracal','8','#include <iostream>\nusing namespace std;\nint main()\n{\n	for (int i = 10; i > 6; i = i - 2)\n    	    cout << i;\n	for (int i = -5; i > -7; i--)\n    	    cout << i + 1;\n	return 0;\n}','1086- -6','108-4-5','108-5-6','86-4-5','B',1,''),('spotted-caracal','9','Which member function is used to determine whether the stream object is currently associated with a file?','is_open','buf','string','none of the above','A',1,''),('spotted-caracal','10','#include <iostream>\nusing namespace std;\n\nclass Test {\n    static int i;\n    int j;\n};\n\nint Test::i;\n\nint main() {\n    cout<<sizeof(Test);\n    return 0;\n}\nAssume size of int as 4 bytes','4','8','Compile Error','Run time Error','A',2,''),('spotted-caracal','11','When can we have two classes with same name?','Not possible','In different files','Different namespace','Anywhere','C',1,''),('spotted-caracal','12',' #include <iostream>\nusing namespace std;\n\nclass X {\npublic: X()\n    	{ cout<<\"X\"; }\n    	~X()\n    	{ cout<<\"~X\"; }\n};\nclass Y : public X {\npublic: Y()\n    	{ cout<<\"Y\"; }\n    	~Y()\n    	{ cout<<\"~Y\"; }\n};\nint main() {\n	Y obj;\n	return 0;\n}','XY~X~Y','XY~Y~X','X~XY~Y','X~X~YY','B',1,''),('spotted-caracal','13','#include <stdio.h>\nint main()\n{\n	int a = 1, b = 2, c = 3;\n	char d = 0;\n	if (a, b, c, d) {\n    	printf(\"enter in the if\\n\");\n	}\n	printf(\"not enterd\\n\");\n	return 0;\n}','enter in the if','not entered','run time error','segmentation fault','B',2,''),('spotted-caracal','14','#include <iostream>\nusing namespace std;\nint main()\n{\n cout<<\"Hello\";;;;;\n return 0;\n}','Compilation Error','Runtime Error','Hello','Hello;;;;','C',1,''),('spotted-caracal','15','The two statements that can be used to change the flow of control are ________','if and while','if and switch','switch and do-while','break and continue','B',1,''),('spotted-caracal','16','If p and q are assigned values 2 and 3 respectively then the statement p=q++','Gives an error message','Assigns a value 4 to p','Assigns a value 3 to p','Assigns a value 5 to p','C',1,''),('spotted-caracal','17','#include <iostream>\nusing namespace std;\nint main()\n{\n	int i, x[5], y, z[5];\n	for (i = 0; i < 5; i++) {\n    	    x[i] = i;\n    	    z[i] = i + 3;\n    	    y = z[i];\n    	    x[i] = y++;\n	}\n	for (i = 0; i < 5; i++)\n    	    cout << x[i] << \" \";\n	return 0;\n}','3 4 5 6 7','4 5 6 7 8','2 3 4 5 6','none of above','A',2,''),('spotted-caracal','18','#include <stdio.h>\n#define square(x) (x * x)\n\nint main()\n{\n	int x, y = 1;\n	x = square(y + 1);\n	printf(\"%d\\n\", x);\n	return 0;\n}\n','Error','4','3','Garbage Value','C',1,''),('spotted-caracal','19','If a variable is a pointer to a structure, then which of the following operator is used to access data members of the structure through the pointer variable?','.','*','&','->','D',1,''),('spotted-caracal','20','#include <stdio.h>\nint main()\n{\n	int i=3, *j, k;\n	j = &i;\n	printf(“%d\\n”, i**j*i+*j);\n	return 0;\n}','30','27','9','3','A',1,''),('spotted-caracal','21','For automatic objects, constructors and destructors are called each time the objects','Enter and leave scope','Inherit parent class','Are Constructed','Are destroyed','A',1,''),('spotted-caracal','22','#include <iostream>\nusing namespace std;\nint n(char, int);\nint (*p) (char, int) = n;\nint main()\n{\n	(*p)(\'d\', 9);\n	p(10, 9);\n	return 0;\n}\n\nint n(char c, int i)\n{\n	cout << c <<  i;\n	return 0;\n}','d9\n9','d9d9','d9','d9109','A',2,''),('spotted-caracal','23','void main()\n{\n	int a = 1;\n	switch(a)\n	{\n    	case 1: cout<<\"One\";\n    	case 2: cout<<\"Two\";\n    	case 3: cout<<\"Three\";\n    	default: cout<<\"Default\";\n	}\n\n}','One','OneTwoThree','Default','OneTwoThreeDefault','D',1,''),('spotted-caracal','24','#include <stdio.h>\nint main()\n{\n	int val = 1;\n\n	do {\n    	    val++;\n    	    ++val;\n	} while (val++ > 25);\n	printf(\"%d\\n\", val);\n	return 0;\n}','25','3','4','26','C',1,''),('spotted-caracal','25','#include <stdio.h>\nvoid main()\n{\n	printf(6 + \"Geeks for Geeks\");\n}','6Geeks for Geeks','Geeks for Geeks','for Geeks','Compile time error','C',2,'');
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
INSERT INTO `studentTestInfo` VALUES ('vivek','groovy-uakari','00:00:00',1),('vivekkairi','topaz-caterpillar','00:00:00',1),('vivek','spotted-caracal','00:00:00',1);
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
INSERT INTO `students` VALUES ('vivek','groovy-uakari','13','b'),('vivek','groovy-uakari','6','c'),('vivek','groovy-uakari','8','a'),('vivek','groovy-uakari','7','d'),('vivek','groovy-uakari','22','a'),('vivekkairi','topaz-caterpillar','12','a'),('vivekkairi','topaz-caterpillar','16','c'),('vivekkairi','topaz-caterpillar','22','c'),('vivekkairi','topaz-caterpillar','11','b'),('vivekkairi','topaz-caterpillar','2','a'),('vivek','spotted-caracal','4','a'),('vivek','spotted-caracal','16','c'),('vivek','spotted-caracal','7','d');
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
  `password` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topic` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neg_mark` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES ('vivek','groovy-uakari','2019-10-09 07:30:00','2019-10-10 07:28:00',120,1,'qwe','Programming','c',0),('vivek','topaz-caterpillar','2019-10-09 08:20:00','2019-10-10 07:36:00',300,1,'qwe','Programming','C',0),('nikhil','spotted-caracal','2019-10-09 09:49:00','2019-10-10 09:15:00',300,1,'qwe','Programming','C',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (12,'vivek','Vivek Kairi','vivekkairi30oct@gmail.com','$5$rounds=535000$Sd1oGEHU/I0D3lHS$CWLVUKx2pdm2Z2UOmrrNz2vJNjOv48aUSeoOh1JDi2D','2019-10-09 06:37:43',1),(13,'vivekkairi','Nikhil','thewirejunction@gmail.com','$5$rounds=535000$MOof29q4rcO7aEVZ$f8niHlvAFClsatnSALe6LrOdCcUORsxdBHFxl0MDBQ1','2019-10-09 08:02:07',1),(14,'nikhil','Nikhil','nmkhairnar@gmail.com','$5$rounds=535000$6cXJnMENkIEMsgj2$xK4Mv0Icf630VZaFMlX8QrRDGcPNS9btsTURaPqZ6b9','2019-10-09 09:46:24',1);
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

-- Dump completed on 2019-10-15 19:56:20
