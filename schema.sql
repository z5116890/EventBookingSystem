BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `venue` (
	`id`	INTEGER NOT NULL,
	`name`	VARCHAR ( 80 ) NOT NULL,
	`location`	VARCHAR ( 80 ) NOT NULL,
	PRIMARY KEY(`id`)
);
INSERT INTO `venue` VALUES (1,'venue 0','Sydney');
INSERT INTO `venue` VALUES (2,'venue 1','Melbourn');
INSERT INTO `venue` VALUES (3,'venue 2','Canberra');
INSERT INTO `venue` VALUES (4,'venue 3','Hobart');
INSERT INTO `venue` VALUES (5,'venue 4','Newcastle');
INSERT INTO `venue` VALUES (6,'venue 5','Darwin');
CREATE TABLE IF NOT EXISTS `user` (
	`id`	INTEGER NOT NULL,
	`name`	VARCHAR ( 80 ) NOT NULL,
	`password`	VARCHAR ( 80 ) NOT NULL,
	`email`	VARCHAR ( 80 ) NOT NULL,
	`role`	VARCHAR ( 50 ),
	`secret_token`	VARCHAR ( 80 ),
	`password_attempt`	INTEGER,
	`description`	TEXT,
	PRIMARY KEY(`id`)
);
INSERT INTO `user` VALUES (1111,'Student','1111','henrypoon1231@gmail.com','trainee','',0,NULL);
INSERT INTO `user` VALUES (1234,'Admin','1234','henrypoon1231@gmail.com','trainer','62b05250f412ee7e8b0253025d4e55fc4d4d46b1bc6f89be54d3514226d3d680',0,'Steven Paul Jobs (/dʒɒbz/; February 24, 1955 – October 5, 2011) was an American entrepreneur and business magnate. He was the chairman, chief executive officer (CEO), and a co-founder of Apple Inc., chairman and majority shareholder of Pixar, a member of The Walt Disney Company''s board of directors following its acquisition of Pixar, and the founder, chairman, and CEO of NeXT. Jobs and Apple co-founder Steve Wozniak are widely recognized as pioneers of the microcomputer revolution of the 1970s and 1980s.

Jobs was born in San Francisco, California, to parents who put him up for adoption at birth. He was raised in the San Francisco Bay Area during the 1960s. He attended Reed College in 1972 before dropping out that same year, and traveled through India in 1974 seeking enlightenment and studying Zen Buddhism. His declassified FBI report states that he used marijuana and LSD while he was in college, and he once told a reporter that taking LSD was "one of the two or three most important things" that he did in his life.

Jobs and Wozniak co-founded Apple in 1976 to sell Wozniak''s Apple I personal computer. Together the duo gained fame and wealth a year later for the Apple II, one of the first highly successful mass-produced personal computers. Jobs saw the commercial potential of the Xerox Alto in 1979, which was mouse-driven and had a graphical user interface (GUI). This led to development of the unsuccessful Apple Lisa in 1983, followed by the breakthrough Macintosh in 1984, the first mass-produced computer with a GUI. The Macintosh introduced the desktop publishing industry in 1985 with the addition of the Apple LaserWriter, the first laser printer to feature vector graphics. Jobs was forced out of Apple in 1985 after a long power struggle. Jobs took a few of Apple''s members with him to found NeXT, a computer platform development company that specialized in computers for higher-education and business markets. In addition, he helped to develop the visual effects industry when he funded the computer graphics division of George Lucas''s Lucasfilm in 1986. The new company was Pixar, which produced Toy Story, the first fully computer-animated film.

Apple merged with NeXT in 1997, and Jobs became CEO of his former company within a few months. He was largely responsible for helping revive Apple, which had been at the verge of bankruptcy. He worked closely with designer Jony Ive to develop a line of products that had larger cultural ramifications, beginning in 1997 with the "Think different" advertising campaign and leading to the iMac, iTunes, iTunes Store, Apple Store, iPod, iPhone, App Store, and the iPad. In 2001, the original Mac OS was replaced with a completely new Mac OS X, based on NeXT''s NeXTSTEP platform, giving the OS a modern Unix-based foundation for the first time. Jobs was diagnosed with a pancreatic neuroendocrine tumor in 2003. He died at age 56 on October 5, 2011, of respiratory arrest related to the tumor.');
INSERT INTO `user` VALUES (4119988,'name4119988','pass10950','z4119988@unsw.net','trainer','',0,NULL);
INSERT INTO `user` VALUES (4119989,'name4119989','pass9588','z4119989@unsw.net','trainer','',0,NULL);
INSERT INTO `user` VALUES (4119990,'name4119990','pass9132','z4119990@unsw.net','trainer','',0,NULL);
INSERT INTO `user` VALUES (4119991,'name4119991','pass29938','z4119991@unsw.net','trainer','',0,NULL);
INSERT INTO `user` VALUES (4119992,'name4119992','pass11829','z4119992@unsw.net','trainer','',0,NULL);
INSERT INTO `user` VALUES (4119993,'name4119993','pass15608','z4119993@unsw.net','trainer','',0,NULL);
INSERT INTO `user` VALUES (4119994,'name4119994','pass9823','z4119994@unsw.net','trainer','',0,NULL);
INSERT INTO `user` VALUES (4119995,'name4119995','pass20316','z4119995@unsw.net','trainer','',0,NULL);
INSERT INTO `user` VALUES (4119996,'name4119996','pass4522','z4119996@unsw.net','trainer','',0,NULL);
INSERT INTO `user` VALUES (4119997,'name4119997','pass29249','z4119997@unsw.net','trainer','',0,NULL);
INSERT INTO `user` VALUES (4119998,'name4119998','pass12718','z4119998@unsw.net','trainer','',0,NULL);
INSERT INTO `user` VALUES (4119999,'name4119999','pass30778','z4119999@unsw.net','trainer','',0,NULL);
INSERT INTO `user` VALUES (6119988,'name6119988','pass6890','z6119988@unsw.net','trainee','',0,NULL);
INSERT INTO `user` VALUES (6119989,'name6119989','pass28383','z6119989@unsw.net','trainee','',0,NULL);
INSERT INTO `user` VALUES (6119990,'name6119990','pass3474','z6119990@unsw.net','trainee','',0,NULL);
INSERT INTO `user` VALUES (6119991,'name6119991','pass7630','z6119991@unsw.net','trainee','',0,NULL);
INSERT INTO `user` VALUES (6119992,'name6119992','pass17116','z6119992@unsw.net','trainee','',0,NULL);
INSERT INTO `user` VALUES (6119993,'name6119993','pass32573','z6119993@unsw.net','trainee','',0,NULL);
INSERT INTO `user` VALUES (6119994,'name6119994','pass24064','z6119994@unsw.net','trainee','',0,NULL);
INSERT INTO `user` VALUES (6119995,'name6119995','pass17756','z6119995@unsw.net','trainee','',0,NULL);
INSERT INTO `user` VALUES (6119996,'name6119996','pass17077','z6119996@unsw.net','trainee','',0,NULL);
INSERT INTO `user` VALUES (6119997,'name6119997','pass27204','z6119997@unsw.net','trainee','',0,NULL);
INSERT INTO `user` VALUES (6119998,'name6119998','pass14774','z6119998@unsw.net','trainee','',0,NULL);
INSERT INTO `user` VALUES (6119999,'name6119999','pass18234','z6119999@unsw.net','trainee','',0,NULL);
INSERT INTO `user` VALUES (6120002,'Steve Jobs','1234','henrypoon1231@gmail.com','guest','',0,'Steven Paul Jobs (/dʒɒbz/; February 24, 1955 – October 5, 2011) was an American entrepreneur and business magnate. He was the chairman, chief executive officer (CEO), and a co-founder of Apple Inc., chairman and majority shareholder of Pixar, a member of The Walt Disney Company''s board of directors following its acquisition of Pixar, and the founder, chairman, and CEO of NeXT. Jobs and Apple co-founder Steve Wozniak are widely recognized as pioneers of the microcomputer revolution of the 1970s and 1980s.

Jobs was born in San Francisco, California, to parents who put him up for adoption at birth. He was raised in the San Francisco Bay Area during the 1960s. He attended Reed College in 1972 before dropping out that same year, and traveled through India in 1974 seeking enlightenment and studying Zen Buddhism. His declassified FBI report states that he used marijuana and LSD while he was in college, and he once told a reporter that taking LSD was "one of the two or three most important things" that he did in his life.

Jobs and Wozniak co-founded Apple in 1976 to sell Wozniak''s Apple I personal computer. Together the duo gained fame and wealth a year later for the Apple II, one of the first highly successful mass-produced personal computers. Jobs saw the commercial potential of the Xerox Alto in 1979, which was mouse-driven and had a graphical user interface (GUI). This led to development of the unsuccessful Apple Lisa in 1983, followed by the breakthrough Macintosh in 1984, the first mass-produced computer with a GUI. The Macintosh introduced the desktop publishing industry in 1985 with the addition of the Apple LaserWriter, the first laser printer to feature vector graphics. Jobs was forced out of Apple in 1985 after a long power struggle. Jobs took a few of Apple''s members with him to found NeXT, a computer platform development company that specialized in computers for higher-education and business markets. In addition, he helped to develop the visual effects industry when he funded the computer graphics division of George Lucas''s Lucasfilm in 1986. The new company was Pixar, which produced Toy Story, the first fully computer-animated film.

Apple merged with NeXT in 1997, and Jobs became CEO of his former company within a few months. He was largely responsible for helping revive Apple, which had been at the verge of bankruptcy. He worked closely with designer Jony Ive to develop a line of products that had larger cultural ramifications, beginning in 1997 with the "Think different" advertising campaign and leading to the iMac, iTunes, iTunes Store, Apple Store, iPod, iPhone, App Store, and the iPad. In 2001, the original Mac OS was replaced with a completely new Mac OS X, based on NeXT''s NeXTSTEP platform, giving the OS a modern Unix-based foundation for the first time. Jobs was diagnosed with a pancreatic neuroendocrine tumor in 2003. He died at age 56 on October 5, 2011, of respiratory arrest related to the tumor.');
INSERT INTO `user` VALUES (6120003,'Austin','1234','austin@xxx.com','guest','',0,'Austin, Travis County and Williamson County have been the site of human habitation since at least 9200 BC. The area''s earliest known inhabitants lived during the late Pleistocene (Ice Age) and are linked to the Clovis culture around 9200 BC (11,200 years ago), based on evidence found throughout the area and documented at the much-studied Gault Site, midway between Georgetown and Fort Hood.[28]

When settlers arrived from Europe, the Tonkawa tribe inhabited the area. The Comanches and Lipan Apaches were also known to travel through the area.[29] Spanish colonists, including the Espinosa-Olivares-Aguirre expedition, traveled through the area for centuries, though few permanent settlements were created for some time.[30] In 1730, three missions from East Texas were combined and reestablished as one mission on the south side of the Colorado River, in what is now Zilker Park, in Austin. The mission was in this area for only about seven months, and then was moved to San Antonio de Béxar and split into three missions.[31]

Early in the 19th century, Spanish forts were established in what are now Bastrop and San Marcos.[30][32] Following Mexico''s independence, new settlements were established in Central Texas, but growth in the region was stagnant because of conflicts with the regional Native Americans.[32][33][34]

In 1835–1836, Texans fought and won independence from Mexico. Texas thus became an independent country with its own president, congress, and monetary system. After Vice President Mirabeau B. Lamar visited the area during a buffalo-hunting expedition between 1837 and 1838, he proposed that the republic''s capital, then in Houston, be relocated to the area situated on the north bank of the Colorado River (near the present-day Congress Avenue Bridge). In 1839, the Texas Congress formed a commission to seek a site for a new capital to be named for Stephen F. Austin.[35] Mirabeau B. Lamar, second president of the newly formed Republic of Texas, advised the commissioners to investigate the area named Waterloo, noting the area''s hills, waterways, and pleasant surroundings.[36] Waterloo was selected, and "Austin" was chosen as the town''s new name.[37] The location was seen as a convenient crossroads for trade routes between Santa Fe and Galveston Bay, as well as routes between northern Mexico and the Red River.[38]


An 1873 illustration of Edwin Waller''s layout for Austin
Edwin Waller was picked by Lamar to survey the village and draft a plan laying out the new capital.[35] The original site was narrowed to 640 acres (260 ha) that fronted the Colorado River between two creeks, Shoal Creek and Waller Creek, which was later named in his honor. The 14-block grid plan was bisected by a broad north-south thoroughfare, Congress Avenue, running up from the river to Capital Square, where the new Texas State Capitol was to be constructed. A temporary one-story capitol was erected on the corner of Colorado and 8th Streets. On August 1, 1839, the first auction of 217 out of 306 lots total was held.[35][38] The grid plan Waller designed and surveyed now forms the basis of downtown Austin.

In 1840, a series of conflicts between the Texas Rangers and the Comanches, known as the Council House Fight and the Battle of Plum Creek, pushed the Comanches westward, mostly ending conflicts in Central Texas.[39] Settlement in the area began to expand quickly. Travis County was established in 1840, and the surrounding counties were mostly established within the next two decades.[34]

Initially, the new capital thrived. But Lamar''s political enemy, Sam Houston, used two Mexican army incursions to San Antonio as an excuse to move the government. Sam Houston fought bitterly against Lamar''s decision to establish the capital in such a remote wilderness. The men and women who traveled mainly from Houston to conduct government business were intensely disappointed as well. By 1840, the population had risen to 856, of whom nearly half fled from Austin when Congress recessed.[40] The resident African American population listed in January of this same year was 176.[41] The fear of Austin''s proximity to the Indians and Mexico, which still considered Texas a part of their land, created an immense motive for Sam Houston, the first and third President of the Republic of Texas, to relocate the capital once again in 1841. Upon threats of Mexican troops in Texas, Houston raided the Land Office to transfer all official documents to Houston for safe keeping in what was later known as the Archive War, but the people of Austin would not allow this unaccompanied decision to be executed. The documents stayed, but the capital would temporarily move from Austin to Houston to Washington-on-the-Brazos. Without the governmental body, Austin''s population declined to a low of only a few hundred people throughout the early 1840s. The voting by the fourth President of the Republic, Anson Jones, and Congress, who reconvened in Austin in 1845, settled the issue to keep Austin the seat of government, as well as annex the Republic of Texas into the United States.


Statue of the Goddess of Liberty on the Texas State Capitol grounds prior to installation on top of the rotunda
In 1860, 38% of Travis County residents were slaves.[42] In 1861, with the outbreak of the American Civil War, voters in Austin and other Central Texas communities voted against secession.[32][35] However, as the war progressed and fears of attack by Union forces increased, Austin contributed hundreds of men to the Confederate forces. The African American population of Austin swelled dramatically after the enforcement of the Emancipation Proclamation in Texas by Union General Gordon Granger at Galveston, in an event commemorated as Juneteenth. Black communities such as Wheatville, Pleasant Hill, and Clarksville were established, with Clarksville being the oldest surviving freedomtown ‒ the original post-Civil War settlements founded by former African-American slaves ‒ west of the Mississippi River.[35] In 1870, blacks made up 36.5% of Austin''s population.[43]

The postwar period saw dramatic population and economic growth. The opening of the Houston and Texas Central Railway (H&TC) in 1871[44] turned Austin into the major trading center for the region, with the ability to transport both cotton and cattle. The Missouri, Kansas & Texas (MKT) line followed close behind.[45] Austin was also the terminus of the southernmost leg of the Chisholm Trail, and "drovers" pushed cattle north to the railroad.[46] Cotton was one of the few crops produced locally for export, and a cotton gin engine was located downtown near the trains for "ginning" cotton of its seeds and turning the product into bales for shipment.[47] However, as other new railroads were built through the region in the 1870s, Austin began to lose its primacy in trade to the surrounding communities.[35] In addition, the areas east of Austin took over cattle and cotton production from Austin, especially in towns like Hutto and Taylor that sit over the blackland prairie, with its deep, rich soils for producing cotton and hay.[48][49]

In September 1881, Austin public schools held their first classes. The same year, Tillotson Collegiate and Normal Institute (now part of Huston–Tillotson University) opened its doors. The University of Texas held its first classes in 1883, although classes had been held in the original wooden state capitol for four years before.[50]

During the 1880s, Austin gained new prominence as the state capitol building was completed in 1888 and claimed as the seventh largest building in the world.[35] In the late 19th century, Austin expanded its city limits to more than three times its former area, and the first granite dam was built on the Colorado River to power a new street car line and the new "moon towers".[35] Unfortunately, the first dam washed away in a flood on April 7, 1900.[51]

In the 1920s and 1930s, Austin launched a series of civic development and beautification projects that created much of the city''s infrastructure and many of its parks. In addition, the state legislature established the Lower Colorado River Authority (LCRA) that, along with the city of Austin, created the system of dams along the Colorado River to form the Highland Lakes. These projects were enabled in large part because the Public Works Administration provided Austin with greater funding for municipal construction projects than other Texas cities.[35]


Bob Bullock Texas History Museum in Austin. Its mission is to "tell the story of Texas".
During the early twentieth century, a three-way system of social segregation emerged in Austin, with Anglos, African Americans and Mexicans being separated by custom or law in most aspects of life, including housing, health care, and education. Many of the municipal improvement programs initiated during this period—such as the construction of new roads, schools, and hospitals—were deliberately designed to institutionalize this system of segregation. Deed restrictions also played an important role in residential segregation. After 1935 most housing deeds prohibited African Americans (and sometimes other nonwhite groups) from using land.[52] Combined with the system of segregated public services, racial segregation increased in Austin during the first half of the twentieth century, with African Americans and Mexicans experiencing high levels of discrimination and social marginalization.[53]

In 1940, the destroyed granite dam on the Colorado River was finally replaced by a hollow concrete dam[54] that formed Lake McDonald (now called Lake Austin) and which has withstood all floods since. In addition, the much larger Mansfield Dam was built by the LCRA upstream of Austin to form Lake Travis, a flood-control reservoir.[55] In the early 20th century, the Texas Oil Boom took hold, creating tremendous economic opportunities in Southeast Texas and North Texas. The growth generated by this boom largely passed by Austin at first, with the city slipping from fourth largest to 10th largest in Texas between 1880 and 1920.[35]

After the mid-20th century, Austin became established as one of Texas'' major metropolitan centers. In 1970, the U.S. Census Bureau reported Austin''s population as 14.5% Hispanic, 11.9% black, and 73.4% non-Hispanic white.[43] In the late 20th century, Austin emerged as an important high tech center for semiconductors and software. The University of Texas at Austin emerged as a major university.[56]

The 1970s saw Austin''s emergence in the national music scene, with local artists such as Willie Nelson, Asleep at the Wheel, and Stevie Ray Vaughan and iconic music venues such as the Armadillo World Headquarters. Over time, the long-running television program Austin City Limits, its namesake Austin City Limits Festival, and the South by Southwest music festival solidified the city''s place in the music industry.[11]');
INSERT INTO `user` VALUES (6120007,'Hello','1234','hello@world.com','guest','',0,'There are many variations on the punctuation and casing of the phrase. Variations include the presence or absence of the comma and exclamation mark, and the capitalization of the ''H'', both the ''H'' and the ''W'', or neither. Some languages are forced to implement different forms, such as "HELLO WORLD", on systems that support only capital letters, while many "hello, world" programs in esoteric languages print out a slightly modified string. For example, the first non-trivial Malbolge program printed "HEllO WORld", this having been determined to be good enough.[11]

There are variations in spirit, as well. Functional programming languages, like Lisp, ML and Haskell, tend to substitute a factorial program for Hello, World, as functional programming emphasizes recursive techniques, whereas the original examples emphasize I/O, which violates the spirit of pure functional programming by producing side effects. Languages otherwise capable of Hello, World (Assembly, C, VHDL) may also be used in embedded systems, where text output is either difficult (requiring additional components or communication with another computer) or nonexistent. For devices such as microcontrollers, field-programmable gate arrays, and CPLD''s, "Hello, World" may thus be substituted with a blinking LED, which demonstrates timing and interaction between components.[12][13][14][15][16]

The Debian and Ubuntu Linux distributions provide the "hello, world" program through the apt packaging system; this allows users to simply type "apt-get install hello" for the program to be installed, along with any software dependencies. While of itself useless, it serves as a sanity check and a simple example to newcomers of how to install a package. It is significantly more useful for developers, however, as it provides an example of how to create a .deb package, either traditionally or using debhelper, and the version of hello used, GNU Hello, serves as an example of how to write a GNU program.[17]');
INSERT INTO `user` VALUES (6120008,'Speaker','1234','hi@gmail.com','guest','',0,'Early years
Zuckerberg began using computers and writing software in middle school. His father taught him Atari BASIC Programming in the 1990s, and later hired software developer David Newman to tutor him privately. Zuckerberg took a graduate course in the subject at Mercy College near his home while still in high school. In one program, since his father''s dental practice was operated from their home, he built a software program he called "ZuckNet" that allowed all the computers between the house and dental office to communicate with each other. It is considered a "primitive" version of AOL''s Instant Messenger, which came out the following year.[21][22]

According to writer Jose Antonio Vargas, "some kids played computer games. Mark created them." Zuckerberg himself recalls this period: "I had a bunch of friends who were artists. They''d come over, draw stuff, and I''d build a game out of it." However, notes Vargas, Zuckerberg was not a typical "geek-klutz", as he later became captain of his prep school fencing team and earned a classics diploma. Napster co-founder Sean Parker, a close friend, notes that Zuckerberg was "really into Greek odysseys and all that stuff", recalling how he once quoted lines from the Roman epic poem Aeneid, by Virgil, during a Facebook product conference.[13]

During Zuckerberg''s high school years, he worked under the company name Intelligent Media Group to build a music player called the Synapse Media Player. The device used machine learning to learn the user''s listening habits, which was posted to Slashdot[23] and received a rating of 3 out of 5 from PC Magazine.[24]

College years
Vargas noted that by the time Zuckerberg began classes at Harvard, he had already achieved a "reputation as a programming prodigy". He studied psychology and computer science and belonged to Alpha Epsilon Pi and Kirkland House.[7][13][25] In his sophomore year, he wrote a program that he called CourseMatch, which allowed users to make class selection decisions based on the choices of other students and also to help them form study groups. A short time later, he created a different program he initially called Facemash that let students select the best looking person from a choice of photos. According to Arie Hasit, Zuckerberg''s roommate at the time, "he built the site for fun". Hasit explains:

We had books called Face Books, which included the names and pictures of everyone who lived in the student dorms. At first, he built a site and placed two pictures, or pictures of two males and two females. Visitors to the site had to choose who was "hotter" and according to the votes there would be a ranking.[26]

The site went up over a weekend, but by Monday morning, the college shut it down, because its popularity had overwhelmed one of Harvard''s network switches and prevented students from accessing the Internet. In addition, many students complained that their photos were being used without permission. Zuckerberg apologized publicly, and the student paper ran articles stating that his site was "completely improper."[26]

The following semester, in January 2004, Zuckerberg began writing code for a new Web site.[27] On February 4, 2004, Zuckerberg launched "Thefacebook", originally located at thefacebook.com.[28]

Six days after the site launched, three Harvard seniors, Cameron Winklevoss, Tyler Winklevoss, and Divya Narendra, accused Zuckerberg of intentionally misleading them into believing he would help them build a social network called HarvardConnection.com, while he was instead using their ideas to build a competing product.[29] The three complained to The Harvard Crimson, and the newspaper began an investigation in response.[citation needed]

Following the official launch of the Facebook social media platform, the three filed a lawsuit against Zuckerberg that resulted in a settlement.[30] The agreed settlement was for 1.2 million Facebook shares.[31]

Zuckerberg dropped out of Harvard in his sophomore year in order to complete his project.[32] In January 2014, he recalled:

I remember really vividly, you know, having pizza with my friends a day or two after—I opened up the first version of Facebook at the time I thought, "You know, someone needs to build a service like this for the world." But I just never thought that we''d be the ones to help do it. And I think a lot of what it comes down to is we just cared more.[33]

On May 28, 2017, Zuckerberg received an honorary degree from Harvard.[34][35]');
CREATE TABLE IF NOT EXISTS `session` (
	`id`	INTEGER NOT NULL,
	`name`	VARCHAR ( 80 ) NOT NULL,
	`start_time`	DATETIME NOT NULL,
	`end_time`	DATETIME NOT NULL,
	`capacity`	INTEGER NOT NULL,
	`speaker_id`	INTEGER NOT NULL,
	`event_id`	INTEGER NOT NULL,
	`deregister_timeframe`	DATETIME,
	`early_bird`	DATETIME,
	`venue_id`	INTEGER NOT NULL,
	PRIMARY KEY(`id`),
	FOREIGN KEY(`venue_id`) REFERENCES `venue`(`id`),
	FOREIGN KEY(`event_id`) REFERENCES `event`(`id`),
	FOREIGN KEY(`speaker_id`) REFERENCES `user`(`id`)
);
INSERT INTO `session` VALUES (1,'Ruby or Rails User Group Sydney','2018-05-10 10:00:00.000000','2018-05-10 13:00:00.000000',60,6120003,1,'2018-05-07 10:00:00.000000','2018-05-10 10:00:00.000000',1);
INSERT INTO `session` VALUES (2,'s1','2018-05-14 07:30:00.000000','2018-05-14 08:30:00.000000',80,6120002,2,'2018-05-12 07:30:00.000000','2018-05-14 07:30:00.000000',1);
INSERT INTO `session` VALUES (3,'s2','2018-05-15 10:00:00.000000','2018-05-15 10:30:00.000000',30,6120003,2,'2018-05-13 10:00:00.000000','2018-05-15 10:00:00.000000',1);
INSERT INTO `session` VALUES (4,'Pink Petal','2018-05-09 10:00:00.000000','2018-05-09 13:00:00.000000',70,1234,3,'2018-05-06 10:00:00.000000','2018-05-09 10:00:00.000000',2);
INSERT INTO `session` VALUES (5,'Speechcraft Course','2018-08-08 10:00:00.000000','2018-08-08 13:00:00.000000',80,1234,4,'2018-08-06 10:00:00.000000','2018-08-08 10:00:00.000000',1);
INSERT INTO `session` VALUES (6,'IoT Career Panel','2018-09-09 10:00:00.000000','2018-09-09 13:00:00.000000',80,1234,6,'2018-09-09 10:00:00.000000','2018-09-09 10:00:00.000000',2);
INSERT INTO `session` VALUES (7,'s1','2019-10-10 10:10:00.000000','2019-10-10 11:10:00.000000',100,4119994,7,'2019-10-10 10:10:00.000000','2019-10-10 10:10:00.000000',3);
INSERT INTO `session` VALUES (8,'s2','2020-02-20 10:10:00.000000','2020-02-20 11:00:00.000000',25,4119988,7,'2020-02-20 10:10:00.000000','2020-02-20 10:10:00.000000',1);
INSERT INTO `session` VALUES (9,'s3','2021-01-01 01:01:00.000000','2021-01-01 01:58:00.000000',34,6120007,7,'2021-01-01 01:01:00.000000','2021-01-01 01:01:00.000000',1);
INSERT INTO `session` VALUES (10,'Course 2','2018-10-10 10:10:00.000000','2018-10-10 10:50:00.000000',100,1234,8,'2018-10-10 10:10:00.000000','2018-10-10 10:10:00.000000',1);
INSERT INTO `session` VALUES (11,'Machine Learning','2018-10-10 01:01:00.000000','2018-10-10 01:59:00.000000',80,1234,9,'2018-10-10 01:01:00.000000','2018-10-10 01:01:00.000000',1);
INSERT INTO `session` VALUES (12,'s1','2019-01-01 01:01:00.000000','2019-01-01 01:01:00.000000',300,4119992,10,'2019-01-01 01:01:00.000000','2019-01-01 01:01:00.000000',1);
INSERT INTO `session` VALUES (13,'s2','2018-01-01 10:10:00.000000','2018-01-01 14:00:00.000000',23,1234,10,'2018-01-01 10:10:00.000000','2018-01-01 10:10:00.000000',1);
INSERT INTO `session` VALUES (14,'testing','2018-01-07 10:00:00.000000','2018-01-07 11:00:00.000000',100,1234,11,'2018-01-07 10:00:00.000000','2018-01-07 10:00:00.000000',1);
INSERT INTO `session` VALUES (15,'s1','2020-01-01 01:12:00.000000','2020-01-01 01:45:00.000000',60,4119993,12,'2020-01-01 01:12:00.000000','2020-01-01 01:12:00.000000',1);
INSERT INTO `session` VALUES (16,'s1','2019-10-01 00:12:00.000000','2019-10-01 00:40:00.000000',20,1234,13,'2019-10-01 00:12:00.000000','2019-10-01 00:12:00.000000',1);
INSERT INTO `session` VALUES (17,'s2','2020-01-01 01:01:00.000000','2020-01-01 01:55:00.000000',22,1234,13,'2020-01-01 01:01:00.000000','2020-01-01 01:01:00.000000',1);
INSERT INTO `session` VALUES (18,'Event','2018-01-01 01:01:00.000000','2018-01-01 01:40:00.000000',20,1234,14,'2018-01-01 01:01:00.000000','2018-01-01 01:01:00.000000',1);
INSERT INTO `session` VALUES (19,'123','2016-01-01 01:01:00.000000','2016-01-01 13:01:00.000000',80,1234,15,'2016-01-01 01:01:00.000000','2016-01-01 01:01:00.000000',1);
INSERT INTO `session` VALUES (20,'s1','2016-01-01 01:01:00.000000','2016-01-01 01:59:00.000000',60,1234,16,'2016-01-01 01:01:00.000000','2016-01-01 01:01:00.000000',1);
INSERT INTO `session` VALUES (21,'test event','2019-05-01 10:10:00.000000','2019-05-01 10:30:00.000000',60,1234,17,'2019-04-30 10:10:00.000000','2019-05-01 10:10:00.000000',1);
INSERT INTO `session` VALUES (22,'s1','2019-01-01 01:00:00.000000','2019-10-01 01:50:00.000000',22,1234,18,'2019-01-01 01:00:00.000000','2019-01-01 01:00:00.000000',1);
INSERT INTO `session` VALUES (23,'s2','2019-05-01 01:01:00.000000','2019-05-01 03:03:00.000000',3,6120008,18,'2019-05-01 01:01:00.000000','2019-05-01 01:01:00.000000',1);
INSERT INTO `session` VALUES (24,'Henry','2018-05-10 10:00:00.000000','2018-05-12 12:00:00.000000',30,1234,19,'2018-05-10 10:00:00.000000','2018-05-10 10:00:00.000000',1);
INSERT INTO `session` VALUES (25,'sss','2019-01-10 05:05:00.000000','2019-01-11 05:06:00.000000',20,1234,20,'2019-01-08 05:05:00.000000','2019-01-07 05:05:00.000000',1);
INSERT INTO `session` VALUES (26,'s2','2019-05-11 05:05:00.000000','2019-06-11 05:06:00.000000',24,6120007,20,'2019-05-09 05:05:00.000000','2019-05-08 05:05:00.000000',1);
INSERT INTO `session` VALUES (27,'hello','2018-10-10 01:01:00.000000','2018-10-10 02:02:00.000000',20,1234,21,'2018-10-10 01:01:00.000000','2018-10-09 01:01:00.000000',4);
INSERT INTO `session` VALUES (28,'tttt','2018-11-05 18:00:00.000000','2018-11-06 17:30:00.000000',60,1234,22,'2018-11-03 18:00:00.000000','2018-11-02 18:00:00.000000',5);
INSERT INTO `session` VALUES (29,'s1','2018-08-02 13:00:00.000000','2018-08-03 14:00:00.000000',21,1234,23,'2018-07-31 13:00:00.000000','2018-07-30 13:00:00.000000',5);
INSERT INTO `session` VALUES (30,'s2','2018-08-06 22:00:00.000000','2018-08-07 22:00:00.000000',11,6120002,23,'2018-08-04 22:00:00.000000','2018-08-03 22:00:00.000000',6);
INSERT INTO `session` VALUES (31,'last','2018-12-31 06:00:00.000000','2019-01-01 19:00:00.000000',60,1234,24,'2018-12-29 06:00:00.000000','2018-12-28 06:00:00.000000',5);
INSERT INTO `session` VALUES (32,'TESTING course','2018-06-02 12:00:00.000000','2018-06-02 16:00:00.000000',12,1234,25,'2018-05-30 12:00:00.000000','2018-05-31 12:00:00.000000',5);
INSERT INTO `session` VALUES (33,'s1','2018-06-30 17:00:00.000000','2018-06-30 19:00:00.000000',15,4119990,26,'2018-06-28 17:00:00.000000','2018-06-25 17:00:00.000000',2);
INSERT INTO `session` VALUES (34,'s2','2018-07-30 18:00:00.000000','2018-07-30 21:00:00.000000',13,6120003,26,'2018-07-28 18:00:00.000000','2018-07-25 18:00:00.000000',2);
CREATE TABLE IF NOT EXISTS `event` (
	`id`	INTEGER NOT NULL,
	`name`	VARCHAR ( 80 ) NOT NULL,
	`description`	TEXT NOT NULL,
	`status`	INTEGER NOT NULL,
	`start_time`	DATETIME NOT NULL,
	`end_time`	DATETIME NOT NULL,
	`convenor_id`	INTEGER NOT NULL,
	`type`	VARCHAR ( 50 ),
	FOREIGN KEY(`convenor_id`) REFERENCES `user`(`id`),
	PRIMARY KEY(`id`)
);
INSERT INTO `event` VALUES (1,'Ruby or Rails','Details
Welcome to RORO Sydney for May 2018! We got Ruby, Rails, food, drinks, talks, and all-round nice people. What can you expect for low, low cost of a few hours of your time? This line-up!

# Presentations - 15 minutes
- My Ruby Story: From political cartooning and animation to ruby developer - Lee Sheppard :: @leesheppard
- Smaller is always better - Phil Nash :: @philnash

# Lightning Talks - 5 minutes
- Don''t be so hard on yourself, Dummy! - Tracy Mu Sung :: @TracyMuSung
- Exercism: Roman Numerals - Mathew Button

Look forward to seeing you there!

---

Want to speak at a future RORO? Tell us about what you want to present here! ',0,'2018-05-10 10:00:00.000000','2018-05-10 13:00:00.000000',1234,'course');
INSERT INTO `event` VALUES (2,'Career Seminar','Details
Luke Ballard

Don''t miss this opportunity to spend an evening a week online with Luke, working through Lightroom workflow, post production in Lightroom, Photoshop and Advanced Editing, and also diving into Nik Effects.
Usually $129 – Code SPC50 gets half price to Sydney Photography Club that''s only $64.50

Starting on 17th April, our 6 week online post-production class is back!

Click the link for bookings https://lukeballard.rezdy.com/book

https://lukeballard.rezdy.com/222057/6-week-online-post-processing-and-editing

This class will run every Tuesday night for 6 weeks.

6 Week Online Post-Production and Editing

Week 1: Workflow and Organisation
Week 2: Lightroom Developing
Week 3: Third Party Plugins – Nik Effects
Week 4: Photoshop 1
Week 5: Lightroom, Photoshop, Nik Effects together
Week 6: Introduction to Compositing

Starts 17 April 7:30 QLD / 8:30pm NSW – Runs every Tuesday night for 2 hours

Usually $129 – Code SPC50 gets half price to Sydney Photography Club that''s only $64.50

Click the link for bookings https://lukeballard.rezdy.com/book',0,'2018-05-14 07:30:00.000000','2018-05-15 10:30:00.000000',1234,'seminar');
INSERT INTO `event` VALUES (3,'Pink Petal','
Apple Inc.
Apple logo black.svg
Apple Park satellite view May 2017.jpg
Apple Park under construction in Cupertino, California, May 2017
Formerly called
Apple Computer Company
(1976–1977)
Apple Computer, Inc.
(1977–2007)
Type
Public
Traded as	
NASDAQ: AAPL
NASDAQ-100 component
DJIA component
S&P 100 component
S&P 500 component
ISIN	US0378331005
Industry	
Computer hardware
Computer software
Consumer electronics
Digital distribution
Semiconductors
Fabless silicon design
Corporate venture capital
Founded	April 1, 1976; 42 years ago
Founders	
Steve Jobs
Steve Wozniak
Ronald Wayne
Headquarters	Apple Park, 1 Apple Park Way, Cupertino, California, U.S.
Number of locations
499 retail stores (2017)
Area served
Worldwide
Key people
Arthur D. Levinson (Chairman)
Tim Cook (CEO)
Luca Maestri (CFO)
Jeff Williams (COO)
Products	
Macintosh iPod iPhone iPad Apple Watch Apple TV HomePod macOS iOS watchOS tvOS iLife iWork
Services	
Apple Pay Apple Store iTunes Store App Store Mac App Store iBooks Store iCloud Apple Music
Revenue	Increase US$229.234 billion[1] (2017)
Operating income
Increase US$61.344 billion[1] (2017)
Net income
Increase US$48.351 billion[1] (2017)
Total assets	Increase US$375.319 billion[1] (2017)
Total equity	Increase US$134.047 billion[1] (2017)
Number of employees
123,000[1] (2017)
Subsidiaries	
Shazam Texture FileMaker Inc. Anobit Braeburn Capital Beats Electronics Apple Energy, LLC Apple Sales International[2] Apple Worldwide Video[3]
Website	apple.com
Apple Inc. is an American multinational technology company headquartered in Cupertino, California, that designs, develops, and sells consumer electronics, computer software, and online services. The company''s hardware products include the iPhone smartphone, the iPad tablet computer, the Mac personal computer, the iPod portable media player, the Apple Watch smartwatch, the Apple TV digital media player, and the HomePod smart speaker. Apple''s software includes the macOS and iOS operating systems, the iTunes media player, the Safari web browser, and the iLife and iWork creativity and productivity suites, as well as professional applications like Final Cut Pro, Logic Pro, and Xcode. Its online services include the iTunes Store, the iOS App Store and Mac App Store, Apple Music, and iCloud.

Apple was founded by Steve Jobs, Steve Wozniak, and Ronald Wayne in April 1976 to develop and sell Wozniak''s Apple I personal computer. It was incorporated as Apple Computer, Inc. in January 1977, and sales of its computers, including the Apple II, saw significant momentum and revenue growth for the company. Within a few years, Jobs and Wozniak had hired a staff of computer designers and had a production line. Apple went public in 1980 to instant financial success. Over the next few years, Apple shipped new computers featuring innovative graphical user interfaces, and Apple''s marketing commercials for its products received widespread critical acclaim. However, the high price tag of its products and limited software titles caused problems, as did power struggles between executives at the company. Jobs resigned from Apple and created his own company, NeXT.

As the market for personal computers increased, Apple''s computers saw diminishing sales due to lower-priced products from competitors, in particular those offered with the Microsoft Windows operating system. More executive job shuffles happened at Apple until then-CEO Gil Amelio in 1997 decided to buy NeXT to bring Jobs back. Jobs regained position as CEO, and began a process to rebuild Apple''s status, which included opening Apple''s own retail stores in 2001, making numerous acquisitions of software companies to create a portfolio of software titles, and changing some of the hardware used in its computers. It again saw success and returned to profitability. In January 2007, Jobs announced that Apple Computer, Inc. would be renamed Apple Inc. to reflect its shifted focus toward consumer electronics. He also announced the iPhone, which saw critical acclaim and significant financial success. In August 2011, Jobs resigned as CEO due to health complications, and Tim Cook became the new CEO. Two months later, Jobs died, marking the end of an era for the company.

Apple is the world''s largest information technology company by revenue and the world''s second-largest mobile phone manufacturer after Samsung. In February 2015, Apple became the first U.S. company to be valued at over US$700 billion. The company employs 123,000 full-time employees [4] and maintains 499 retail stores in 22 countries as of December 2017. It operates the iTunes Store, which is the world''s largest music retailer. As of January 2016, more than one billion Apple products are actively in use worldwide.

Apple''s worldwide annual revenue totaled $229 billion for the 2017 fiscal year. The company enjoys a high level of brand loyalty and has been repeatedly ranked as the world''s most valuable brand. However, it receives significant criticism regarding the labor practices of its contractors, its environmental and business practices, including anti-competitive behavior, as well as the origins of source materials.

Contents 
1	History
1.1	1976–84: Founding and incorporation
1.2	1984–91: Success with Macintosh
1.3	1991–97: Decline and restructuring
1.4	1997–2007: Return to profitability
1.5	2007–11: Success with mobile devices
1.6	2011–present: Post-Steve Jobs era; Tim Cook leadership
2	Products
2.1	Mac
2.2	iPod
2.3	iPhone
2.4	iPad
2.5	Apple Watch
2.6	Apple TV
2.7	HomePod
2.8	Software
2.9	Electric vehicles
2.10	Apple Energy
3	Corporate identity
3.1	Logo
3.2	Advertising
3.3	Brand loyalty
3.4	Home page
3.5	Headquarters
3.6	Stores
4	Corporate affairs
4.1	Corporate culture
4.1.1	Lack of innovation
4.2	Manufacturing
4.2.1	Labor practices
4.3	Environmental practices and initiatives
4.3.1	Energy and resources
4.3.2	Toxins
4.3.3	Green bonds
4.4	Finance
4.4.1	Tax practices
4.5	Ownership
4.6	Litigation
4.7	Privacy stance
4.8	Charitable causes
5	Criticism and controversies
6	See also
7	References
7.1	Bibliography
8	Further reading
9	External links
History
Main article: History of Apple Inc.
1976–84: Founding and incorporation

The birthplace of Apple Computer. In 1976, Steve Jobs co-founded the company in the garage of his childhood home on Crist Drive in Los Altos, California.

Apple''s first product, the Apple I, invented by Apple co-founder Steve Wozniak, was sold as an assembled circuit board and lacked basic features such as a keyboard, monitor, and case. The owner of this unit added a keyboard and wooden case.

The Apple II, introduced in 1977, was a major technological advancement over its predecessor.
Apple Computer Company was founded on April 1, 1976, by Steve Jobs, Steve Wozniak and Ronald Wayne.[5] The company''s first product was the Apple I, a computer single-handedly designed and hand-built by Wozniak,[6][7] and first shown to the public at the Homebrew Computer Club.[8][9] Apple I was sold as a motherboard (with CPU, RAM, and basic textual-video chips), which was less than what is now considered a complete personal computer.[10] The Apple I went on sale in July 1976 and was market-priced at $666.66 ($2,867 in 2017 dollars, adjusted for inflation).[11][12][13][14][15][16]

Apple Computer, Inc. was incorporated on January 3, 1977,[17][18] without Wayne, who left and sold his share of the company back to Jobs and Wozniak for $800 only a couple weeks after co-founding Apple.[19][20] Multimillionaire Mike Markkula provided essential business expertise and funding of $250,000 during the incorporation of Apple.[21][22] During the first five years of operations revenues grew exponentially, doubling about every four months. Between September 1977 and September 1980, yearly sales grew from $775,000 to $118 million, an average annual growth rate of 533%.[23][24]

The Apple II, also invented by Wozniak, was introduced on April 16, 1977, at the first West Coast Computer Faire. It differed from its major rivals, the TRS-80 and Commodore PET, because of its character cell-based color graphics and open architecture. While early Apple II models used ordinary cassette tapes as storage devices, they were superseded by the introduction of a ​5 1⁄4-inch floppy disk drive and interface called the Disk II.[25] The Apple II was chosen to be the desktop platform for the first "killer app" of the business world: VisiCalc, a spreadsheet program. VisiCalc created a business market for the Apple II and gave home users an additional reason to buy an Apple II: compatibility with the office.[26] Before VisiCalc, Apple had been a distant third place competitor to Commodore and Tandy.[27][28]

By the end of the 1970s, Apple had a staff of computer designers and a production line. The company introduced the Apple III in May 1980 in an attempt to compete with IBM and Microsoft in the business and corporate computing market.[29] Jobs and several Apple employees, including Jef Raskin, visited Xerox PARC in December 1979 to see the Xerox Alto. Xerox granted Apple engineers three days of access to the PARC facilities in return for the option to buy 100,000 shares (800,000 split-adjusted shares) of Apple at the pre-IPO price of $10 a share.[30]

Jobs was immediately convinced that all future computers would use a graphical user interface (GUI), and development of a GUI began for the Apple Lisa.[31][32] In 1982, however, he was pushed from the Lisa team due to infighting. Jobs took over Jef Raskin''s low-cost-computer project, the Macintosh. A race broke out between the Lisa team and the Macintosh team over which product would ship first. Lisa won the race in 1983 and became the first personal computer sold to the public with a GUI, but was a commercial failure due to its high price tag and limited software titles.[33]

On December 12, 1980, Apple went public at $22 per share,[18] generating more capital than any IPO since Ford Motor Company in 1956, and immediately creating 300 millionaires.[34]

1984–91: Success with Macintosh
See also: Timeline of Macintosh models

The Macintosh, released in 1984, was the first mass-market personal computer that featured an integral graphical user interface and mouse.
In 1984, Apple launched the Macintosh, the first personal computer to be sold without a programming language.[35] Its debut was signified by "1984", a $1.5 million television commercial directed by Ridley Scott that aired during the third quarter of Super Bowl XVIII on January 22, 1984.[36] The commercial is now hailed as a watershed event for Apple''s success[37] and was called a "masterpiece" by CNN[38] and one of the greatest commercials of all time by TV Guide.[39][40]

The Macintosh initially sold well, but follow-up sales were not strong[41] due to its high price and limited range of software titles. The machine''s fortunes changed with the introduction of the LaserWriter, the first PostScript laser printer to be sold at a reasonable price, and PageMaker, an early desktop publishing package. It has been suggested that the combination of these three products were responsible for the creation of the desktop publishing market.[42] The Macintosh was particularly powerful in the desktop publishing market due to its advanced graphics capabilities, which had necessarily been built in to create the intuitive Macintosh GUI.

In 1985, a power struggle developed between Jobs and CEO John Sculley, who had been hired two years earlier.[43] The Apple board of directors instructed Sculley to "contain" Jobs and limit his ability to launch expensive forays into untested products. Rather than submit to Sculley''s direction, Jobs attempted to oust him from his leadership role at Apple. Sculley found out that Jobs had been attempting to organize a coup and called a board meeting at which Apple''s board of directors sided with Sculley and removed Jobs from his managerial duties.[41] Jobs resigned from Apple and founded NeXT Inc. the same year.[44] Wozniak also left Apple in 1985 to pursue other ventures, stating that the company had "been going in the wrong direction for the last five years".[45]


The Macintosh Portable, released in 1989, was Apple''s first battery-powered portable Macintosh personal computer.
After Jobs'' and Wozniak''s departure, the Macintosh product line underwent a steady change of focus to higher price points, the so-called "high-right policy" named for the position on a chart of price vs. profits. Jobs had argued the company should produce products aimed at the consumer market and aimed for a $1000 price for the Macintosh, which they were unable to meet. Newer models selling at higher price points offered higher profit margin, and appeared to have no effect on total sales as power users snapped up every increase in power. Although some worried about pricing themselves out of the market, the high-right policy was in full force by the mid-1980s, notably due to Jean-Louis Gassée''s mantra of "fifty-five or die", referring to the 55% profit margins of the Macintosh II.[46]

This policy began to backfire in the last years of the decade as new desktop publishing programs appeared on PC clones that offered some or much of the same functionality of the Macintosh but at far lower price points. The company lost its monopoly in this market, and had already estranged many of its original consumer customer base who could no longer afford their high-priced products. The Christmas season of 1989 was the first in the company''s history that saw declining sales, and led to a 20% drop in Apple''s stock price.[47] Gassée''s objections were overruled, and he was forced from the company in 1990. Later that year, Apple introduced three lower cost models, the Macintosh Classic, Macintosh LC and Macintosh IIsi, all of which saw significant sales due to pent up demand.

In 1991, Apple introduced the PowerBook, replacing the "luggable" Macintosh Portable with a design that set the current shape for almost all modern laptops. The same year, Apple introduced System 7, a major upgrade to the operating system which added color to the interface and introduced new networking capabilities. It remained the architectural basis for the Classic Mac OS. The success of the PowerBook and other products brought increasing revenue.[43] For some time, Apple was doing incredibly well, introducing fresh new products and generating increasing profits in the process. The magazine MacAddict named the period between 1989 and 1991 as the "first golden age" of the Macintosh.[48]

Apple believed the Apple II series was too expensive to produce and took away sales from the low-end Macintosh.[49] In the 1990s, Apple released the Macintosh LC, and began efforts to promote that computer by advising developer technical support staff to recommend developing applications for Macintosh rather than Apple II, and authorizing salespersons to direct consumers towards Macintosh and away from Apple II.[50] The Apple IIe was discontinued in 1993.[51]

1991–97: Decline and restructuring
See also: Timeline of the Apple II family

The Penlite was Apple''s first attempt at a tablet computer. Created in 1992, the project was designed to bring the Mac OS to a tablet – but was shelved in favor of the Newton.[52]
The success of Apple''s lower-cost consumer models, especially the LC, also led to cannibalization of their higher priced machines. To address this, management introduced several new brands, selling largely identical machines at different price points aimed at different markets. These were the high-end Quadra, the mid-range Centris line, and the ill-fated Performa series. This led to significant market confusion, as customers did not understand the difference between models.[53]

Apple also experimented with a number of other unsuccessful consumer targeted products during the 1990s, including digital cameras, portable CD audio players, speakers, video consoles, the eWorld online service, and TV appliances. Enormous resources were also invested in the problem-plagued Newton division based on John Sculley''s unrealistic market forecasts.[citation needed] Ultimately, none of these products helped and Apple''s market share and stock prices continued to slide.[citation needed]

Throughout this period, Microsoft continued to gain market share with Windows by focusing on delivering software to cheap commodity personal computers, while Apple was delivering a richly engineered but expensive experience.[54] Apple relied on high profit margins and never developed a clear response; instead, they sued Microsoft for using a GUI similar to the Apple Lisa in Apple Computer, Inc. v. Microsoft Corp.[55] The lawsuit dragged on for years before it was finally dismissed. At this time, a series of major product flops and missed deadlines sullied Apple''s reputation, and Sculley was replaced as CEO by Michael Spindler.[56]


The Newton was Apple''s first foray into the PDA markets, as well as one of the first in the industry. Despite being a financial flop at the time of its release, it helped pave the way for the PalmPilot and Apple''s own iPhone and iPad in the future.
By the early 1990s, Apple was developing alternative platforms to the Macintosh, such as A/UX. The Macintosh platform itself was becoming outdated because it was not built for multitasking and because several important software routines were programmed directly into the hardware. In addition, Apple was facing competition from OS/2 and UNIX vendors such as Sun Microsystems. The Macintosh would need to be replaced by a new platform or reworked to run on more powerful hardware.[57]

In 1994, Apple allied with IBM and Motorola in the AIM alliance with the goal of creating a new computing platform (the PowerPC Reference Platform), which would use IBM and Motorola hardware coupled with Apple software. The AIM alliance hoped that PReP''s performance and Apple''s software would leave the PC far behind and thus counter Microsoft. The same year, Apple introduced the Power Macintosh, the first of many Apple computers to use Motorola''s PowerPC processor.[58]

In 1996, Spindler was replaced by Gil Amelio as CEO. Amelio made numerous changes at Apple, including extensive layoffs and cut costs.[59] After numerous failed attempts to improve Mac OS, first with the Taligent project and later with Copland and Gershwin, Amelio chose to purchase NeXT and its NeXTSTEP operating system and bring Steve Jobs back to Apple.[60]

1997–2007: Return to profitability


Power Mac was a line of Apple Macintosh workstation-class personal computers based on various models of PowerPC microprocessors that were developed from 1994 to 2006.
The NeXT deal was finalized on February 9, 1997,[61] bringing Jobs back to Apple as an advisor. On July 9, 1997, Amelio was ousted by the board of directors after overseeing a three-year record-low stock price and crippling financial losses. Jobs acted as the interim CEO and began restructuring the company''s product line; it was during this period that he identified the design talent of Jonathan Ive, and the pair worked collaboratively to rebuild Apple''s status.[62]

At the 1997 Macworld Expo, Jobs announced that Apple would join Microsoft to release new versions of Microsoft Office for the Macintosh, and that Microsoft had made a $150 million investment in non-voting Apple stock.[63] On November 10, 1997, Apple introduced the Apple Online Store, which was tied to a new build-to-order manufacturing strategy.[64][65]

On August 15, 1998, Apple introduced a new all-in-one computer reminiscent of the Macintosh 128K: the iMac. The iMac design team was led by Ive, who would later design the iPod and the iPhone.[66][67] The iMac featured modern technology and a unique design, and sold almost 800,000 units in its first five months.[68]

During this period,[when?] Apple completed numerous acquisitions to create a portfolio of digital production software for both professionals and consumers. In 1998, Apple purchased Macromedia''s Key Grip software project, signaling an expansion into the digital video editing market. The sale was an outcome of Macromedia''s decision to solely focus upon web development software. The product, still unfinished at the time of the sale, was renamed "Final Cut Pro" when it was launched on the retail market in April 1999.[69][70] The development of Key Grip also led to Apple''s release of the consumer video-editing product iMovie in October 1999.[71] Next, Apple successfully acquired the German company Astarte, which had developed DVD authoring technology, as well as Astarte''s corresponding products and engineering team in April 2000. Astarte''s digital tool DVDirector was subsequently transformed into the professional-oriented DVD Studio Pro software product. Apple then employed the same technology to create iDVD for the consumer market.[71] In July 2001, Apple acquired Spruce Technologies, a PC DVD authoring platform, to incorporate their technology into Apple''s expanding portfolio of digital video projects.[72][73]

In 2002, Apple purchased Nothing Real for their advanced digital compositing application Shake,[74] as well as Emagic for the music productivity application Logic. The purchase of Emagic made Apple the first computer manufacturer to own a music software company. The acquisition was followed by the development of Apple''s consumer-level GarageBand application.[75] The release of iPhoto in the same year completed the iLife suite.[76]

Mac OS X, based on NeXT''s OPENSTEP and BSD Unix, was released on March 24, 2001, after several years of development. Aimed at consumers and professionals alike, Mac OS X aimed to combine the stability, reliability and security of Unix with the ease of use afforded by an overhauled user interface. To aid users in migrating from Mac OS 9, the new operating system allowed the use of OS 9 applications within Mac OS X via the Classic Environment.[77]

On May 19, 2001, Apple opened its first official eponymous retail stores in Virginia and California.[78] On October 23 of the same year, Apple debuted the iPod portable digital audio player. The product, which was first sold on November 10, 2001, was phenomenally successful with over 100 million units sold within six years.[79][80] In 2003, Apple''s iTunes Store was introduced. The service offered online music downloads for $0.99 a song and integration with the iPod. The iTunes Store quickly became the market leader in online music services, with over five billion downloads by June 19, 2008.[81][82] Two years later, the iTunes Store was the world''s largest music retailer.[83][84]',0,'2018-05-09 10:00:00.000000','2018-05-09 13:00:00.000000',1234,'course');
INSERT INTO `event` VALUES (4,'Speechcraft','Details
A Speechcraft workshop can help you become a more confident & poised speaker. Career success often depends on how well you can express yourself.

Speechcraft helps develop skills to assist with job interviews, moments of conversation, sales situations, problem-solving, business meetings & presentations.

Location: The Australian Brewery 350 Annangrove Road, Rouse Hill
Date: Two day program : Saturday 12th & 19th May, 2018, 10.00am to 4.30pm
Cost: $350.00
(includes bonus Toastmaster club membership)
Places are limited. Registrations close 8th May, 2018
Contact: Geri Rich 044 7794 021
gerrym.rich@bigpond.com
A joint undertaking:
Rouse Hill & Quakers Hill Toastmaster club',0,'2018-08-08 10:00:00.000000','2018-08-08 13:00:00.000000',1234,'course');
INSERT INTO `event` VALUES (6,'IoT Career Panel','Details
PLEASE NOTE: registration is only possible via Eventbrite: https://www.eventbrite.com.au/e/iot-career-panel-tickets-45550745506 and not via meetup.com. (RSVP on meetup.com will show as full).

IoT is shaping future careers in business and technology. This panel will allow you to see, how IoT can shape your career and what paths are available to you. The diverse group of panellists comes from different types of organisations and will therefore allow the audience to see IoT career opportunities from various perspectives. Panellist come from user organisation, the start-up eco-system, software and hardware vendors, as well as operational technology providers and consultancies. Questions from the audience will be appreciated, so make sure to bring them with you or build on something you heard during the conversation. This event is also the last module of the new IoT Course @ UNSW.

Program
5.30pm - Registration and networking
6.00pm - Welcome and introduction (Peter Klement)
6.10pm – MCIC and IoT (Fiona Tschaut)
6.20pm – Introducing the panel (Frank Zeichner)
6.30pm – Panel discussion
7.30pm - Next IoE Community event (Anton Kroger)
7.35pm - Networking and drinks
8.30pm - Close

This event is free of charge, but attendance requires registration. Finger food and drinks are included',0,'2018-09-09 10:00:00.000000','2018-09-09 13:00:00.000000',1234,'course');
INSERT INTO `event` VALUES (7,'Python','Python is an interpreted high-level programming language for general-purpose programming. Created by Guido van Rossum and first released in 1991, Python has a design philosophy that emphasizes code readability, notably using significant whitespace. It provides constructs that enable clear programming on both small and large scales.[26]

Python features a dynamic type system and automatic memory management. It supports multiple programming paradigms, including object-oriented, imperative, functional and procedural, and has a large and comprehensive standard library.[27]

Python interpreters are available for many operating systems. CPython, the reference implementation of Python, is open source software[28] and has a community-based development model, as do nearly all of its variant implementations. CPython is managed by the non-profit Python Software Foundation.

Contents 
1	History
2	Features and philosophy
3	Syntax and semantics
3.1	Indentation
3.2	Statements and control flow
3.3	Expressions
3.4	Methods
3.5	Typing
3.6	Mathematics
4	Libraries
5	Development environments
6	Implementations
6.1	Reference implementation
6.2	Other implementations
6.3	Unsupported implementations
6.4	Cross-compilers to other languages
6.5	Performance
7	Development
8	Naming
9	Uses
10	Languages influenced by Python
11	See also
12	References
13	Further reading
14	External links
History

Guido van Rossum, the creator of Python
Main article: History of Python
Python was conceived in the late 1980s,[29] and its implementation began in December 1989[30] by Guido van Rossum at Centrum Wiskunde & Informatica (CWI) in the Netherlands as a successor to the ABC language (itself inspired by SETL)[31] capable of exception handling and interfacing with the Amoeba operating system.[7] Van Rossum remains Python''s principal author. His continuing central role in Python''s development is reflected in the title given to him by the Python community: Benevolent Dictator For Life (BDFL).

On the origins of Python, Van Rossum wrote in 1996:[32]

...In December 1989, I was looking for a "hobby" programming project that would keep me occupied during the week around Christmas. My office ... would be closed, but I had a home computer, and not much else on my hands. I decided to write an interpreter for the new scripting language I had been thinking about lately: a descendant of ABC that would appeal to Unix/C hackers. I chose Python as a working title for the project, being in a slightly irreverent mood (and a big fan of Monty Python''s Flying Circus).

— Guido van Rossum
Python 2.0 was released on 16 October 2000 and had many major new features, including a cycle-detecting garbage collector and support for Unicode. With this release, the development process became more transparent and community-backed.[33]

Python 3.0 (initially called Python 3000 or py3k) was released on 3 December 2008 after a long testing period. It is a major revision of the language that is not completely backward-compatible with previous versions.[34] However, many of its major features have been backported to the Python 2.6.x[35] and 2.7.x version series, and releases of Python 3 include the 2to3 utility, which automates the translation of Python 2 code to Python 3.[36]

Python 2.7''s end-of-life date was initially set at 2015, then postponed to 2020 out of concern that a large body of existing code could not easily be forward-ported to Python 3.[37][38]

Python 3.6 had changes regarding UTF-8 (in Windows, PEP 528 and PEP 529) and Python 3.7.0b1 (PEP 540) adds a new "UTF-8 Mode" (and overrides POSIX locale).

In January 2017, Google announced work on a Python 2.7 to Go transcompiler to improve performance under concurrent workloads.[39]

Features and philosophy
Python is a multi-paradigm programming language. Object-oriented programming and structured programming are fully supported, and many of its features support functional programming and aspect-oriented programming (including by metaprogramming[40] and metaobjects (magic methods)).[41] Many other paradigms are supported via extensions, including design by contract[42][43] and logic programming.[44]

Python uses dynamic typing, and a combination of reference counting and a cycle-detecting garbage collector for memory management. It also features dynamic name resolution (late binding), which binds method and variable names during program execution.

Python''s design offers some support for functional programming in the Lisp tradition. It has filter(), map(), and reduce() functions; list comprehensions, dictionaries, and sets; and generator expressions.[45] The standard library has two modules (itertools and functools) that implement functional tools borrowed from Haskell and Standard ML.[46]

The language''s core philosophy is summarized in the document The Zen of Python (PEP 20), which includes aphorisms such as:[47]

Beautiful is better than ugly
Explicit is better than implicit
Simple is better than complex
Complex is better than complicated
Readability counts
Rather than having all of its functionality built into its core, Python was designed to be highly extensible. This compact modularity has made it particularly popular as a means of adding programmable interfaces to existing applications. Van Rossum''s vision of a small core language with a large standard library and easily extensible interpreter stemmed from his frustrations with ABC, which espoused the opposite approach.[29]

While offering choice in coding methodology, the Python philosophy rejects exuberant syntax (such as that of Perl) in favor of a simpler, less-cluttered grammar. As Alex Martelli put it: "To describe something as ''clever'' is not considered a compliment in the Python culture."[48] Python''s philosophy rejects the Perl "there is more than one way to do it" approach to language design in favor of "there should be one—and preferably only one—obvious way to do it".[47]

Python''s developers strive to avoid premature optimization, and reject patches to non-critical parts of CPython that would offer marginal increases in speed at the cost of clarity.[49] When speed is important, a Python programmer can move time-critical functions to extension modules written in languages such as C, or use PyPy, a just-in-time compiler. Cython is also available, which translates a Python script into C and makes direct C-level API calls into the Python interpreter.

An important goal of Python''s developers is keeping it fun to use. This is reflected in the language''s name—a tribute to the British comedy group Monty Python[50]—and in occasionally playful approaches to tutorials and reference materials, such as examples that refer to spam and eggs (from a famous Monty Python sketch) instead of the standard foo and bar.[51][52]

A common neologism in the Python community is pythonic, which can have a wide range of meanings related to program style. To say that code is pythonic is to say that it uses Python idioms well, that it is natural or shows fluency in the language, that it conforms with Python''s minimalist philosophy and emphasis on readability. In contrast, code that is difficult to understand or reads like a rough transcription from another programming language is called unpythonic.

Users and admirers of Python, especially those considered knowledgeable or experienced, are often referred to as Pythonists, Pythonistas, and Pythoneers.[53][54]

Syntax and semantics
Main article: Python syntax and semantics
Python is meant to be an easily readable language. Its formatting is visually uncluttered, and it often uses English keywords where other languages use punctuation. Unlike many other languages, it does not use curly brackets to delimit blocks, and semicolons after statements are optional. It has fewer syntactic exceptions and special cases than C or Pascal.[55]

Indentation
Main article: Python syntax and semantics § Indentation
Python uses whitespace indentation, rather than curly brackets or keywords, to delimit blocks. An increase in indentation comes after certain statements; a decrease in indentation signifies the end of the current block.[56] Thus, the program''s visual structure accurately represents the program''s semantic structure.[1] This feature is also sometimes termed the off-side rule.

Statements and control flow
Python''s statements include (among others):

The assignment statement (token ''='', the equals sign). This operates differently than in traditional imperative programming languages, and this fundamental mechanism (including the nature of Python''s version of variables) illuminates many other features of the language. Assignment in C, e.g., x = 2, translates to "typed variable name x receives a copy of numeric value 2". The (right-hand) value is copied into an allocated storage location for which the (left-hand) variable name is the symbolic address. The memory allocated to the variable is large enough (potentially quite large) for the declared type. In the simplest case of Python assignment, using the same example, x = 2, translates to "(generic) name x receives a reference to a separate, dynamically allocated object of numeric (int) type of value 2." This is termed binding the name to the object. Since the name''s storage location doesn''t contain the indicated value, it is improper to call it a variable. Names may be subsequently rebound at any time to objects of greatly varying types, including strings, procedures, complex objects with data and methods, etc. Successive assignments of a common value to multiple names, e.g., x = 2; y = 2; z = 2 result in allocating storage to (at most) three names and one numeric object, to which all three names are bound. Since a name is a generic reference holder it is unreasonable to associate a fixed data type with it. However at a given time a name will be bound to some object, which will have a type; thus there is dynamic typing.
The if statement, which conditionally executes a block of code, along with else and elif (a contraction of else-if).
The for statement, which iterates over an iterable object, capturing each element to a local variable for use by the attached block.
The while statement, which executes a block of code as long as its condition is true.
The try statement, which allows exceptions raised in its attached code block to be caught and handled by except clauses; it also ensures that clean-up code in a finally block will always be run regardless of how the block exits.
The raise statement, used to raise a specified exception or re-raise a caught exception.
The class statement, which executes a block of code and attaches its local namespace to a class, for use in object-oriented programming.
The def statement, which defines a function or method.
The with statement, from Python 2.5 released on September 2006,[57] which encloses a code block within a context manager (for example, acquiring a lock before the block of code is run and releasing the lock afterwards, or opening a file and then closing it), allowing Resource Acquisition Is Initialization (RAII)-like behavior and replaces a common try/finally idiom.[58]
The pass statement, which serves as a NOP. It is syntactically needed to create an empty code block.
The assert statement, used during debugging to check for conditions that ought to apply.
The yield statement, which returns a value from a generator function. From Python 2.5, yield is also an operator. This form is used to implement coroutines.
The import statement, which is used to import modules whose functions or variables can be used in the current program. There are three ways of using import: import <module name> [as <alias>] or from <module name> import * or from <module name> import <definition 1> [as <alias 1>], <definition 2> [as <alias 2>], ....
The print statement was changed to the print() function in Python 3.[59]
Python does not support tail call optimization or first-class continuations, and, according to Guido van Rossum, it never will.[60][61] However, better support for coroutine-like functionality is provided in 2.5, by extending Python''s generators.[62] Before 2.5, generators were lazy iterators; information was passed unidirectionally out of the generator. From Python 2.5, it is possible to pass information back into a generator function, and from Python 3.3, the information can be passed through multiple stack levels.[63]

',0,'2019-10-10 10:10:00.000000','2021-01-01 01:58:00.000000',1234,'seminar');
INSERT INTO `event` VALUES (8,'Course 2','Aim:
The aim of this group project is to enable students to consolidate their knowledge in the fundamental
principles of Software Engineering and apply the theoretical concepts to a “hands-on” software engineering
problem. The project will enable students to:
- Develop problem-solving skills to solve ‘real-world’ software engineering problems; analyse the
problem domain, design and develop a solution to the problem
- Learn to work effectively as part of a team by managing your project, planning, and allocation of
responsibilities among the members of your team
- Gain experience in collaborating through the use of a source control
- Apply appropriate design practices and methodologies in the development of their solution
Background:
Your consultancy firm has been called in to the School of Computer Science and Engineering for a new
project. The staff and students at UNSW frequently hold courses and seminars. These events are attended
by both staff and students at the university. Currently, the trainer of each event is responsible for
advertising the event and handling registrations of trainees. The university is interested in making this
process more efficient and would like to develop an online event management system (EMS) that
streamlines the process of planning an event and registering attendees to the event. The university feels
that such a system would help to market and increase the likelihood of attracting more attendees.
The centralised event management system (EMS) should enable course convenors to post different kinds of
events and also enable interested attendees to register online for these events. The system will also allow
attendees registered for a particular event to de-register. The system will be accessible by all UNSW staff
and students. Following an initial discussion with the client, your team has elicited the following preliminary
requirements for the event management system.',0,'2018-10-10 10:10:00.000000','2018-10-10 10:50:00.000000',1234,'course');
INSERT INTO `event` VALUES (9,'Machine Learning','Introduction
Welcome to Machine Learning! In this module, we introduce the core idea of teaching a computer to learn concepts using data—without being explicitly programmed. The Course Wiki is under construction. Please visit the resources tab for the most complete and up-to-date information.
5 videos, 9 readings
expand
Graded: Introduction
Linear Regression with One Variable
Linear regression predicts a real-valued output based on an input value. We discuss the application of linear regression to housing price prediction, present the notion of a cost function, and introduce the gradient descent method for learning.
7 videos, 8 readings
expand
Graded: Linear Regression with One Variable
Linear Algebra Review
This optional module provides a refresher on linear algebra concepts. Basic understanding of linear algebra is necessary for the rest of the course, especially as we begin to cover models with multiple variables.',0,'2018-10-10 01:01:00.000000','2018-10-10 01:59:00.000000',1234,'course');
INSERT INTO `event` VALUES (10,'semsem','Anomaly Detection
Given a large number of data points, we may sometimes want to figure out which ones vary significantly from the average. For example, in manufacturing, we may want to detect defects or anomalies. We show how a dataset can be modeled using a Gaussian distribution, and how the model can be used for anomaly detection.
8 videos, 1 reading
expand
Graded: Anomaly Detection
Recommender Systems
When you buy a product online, most websites automatically recommend other products that you may like. Recommender systems look at patterns of activities between different users and different products to produce these recommendations. In this module, we introduce recommender algorithms such as the collaborative filtering algorithm and low-rank matrix factorization.
More
6 videos, 1 reading
Video: Problem Formulation
Video: Content Based Recommendations
Video: Collaborative Filtering
Video: Collaborative Filtering Algorithm
Video: Vectorization: Low Rank Matrix Factorization
Video: Implementational Detail: Mean Normalization
Reading: Lecture Slides
Programming: Anomaly Detection and Recommender Systems
Show less
Graded: Recommender Systems',0,'2018-01-01 10:10:00.000000','2019-01-01 01:01:00.000000',1234,'seminar');
INSERT INTO `event` VALUES (11,'testing','hello world',1,'2018-01-07 10:00:00.000000','2018-01-07 11:00:00.000000',1234,'course');
INSERT INTO `event` VALUES (12,'sem1','At North American universities, the term "seminar" refers to a course of intense study relating to the student''s major. Seminars typically have significantly fewer students per professor than normal courses, and are generally more specific in topic of study. Seminars can revolve around term papers, exams, presentations, and several other assignments. Seminars are almost always required for university graduation. Normally, participants must not be beginners in the field under discussion at US and Canadian universities. Seminar classes are generally reserved for upper-class students, although at UK and Australian universities seminars are often used for all years. The idea behind the seminar system is to familiarize students more extensively with the methodology of their chosen subject and also to allow them to interact with examples of the practical problems that always occur during research work.

In some European universities, a seminar may be a large lecture course, especially when conducted by a renowned thinker (regardless of the size of the audience or the scope of student participation in discussion). Some non-English speaking countries in Europe use the word seminar (e.g. German Seminar, Slovenian seminar, Polish seminarium) to refer to a university class that includes a term paper or project, as opposed to a lecture class (e.g. German Vorlesung, Slovenian predavanje, Polish wykład). This does not correspond to English use of the term. In some academic institutions, typically in scientific fields, the term "preceptorial" is used interchangeably with "seminar".[4][5]',0,'2020-01-01 01:12:00.000000','2020-01-01 01:45:00.000000',1234,'seminar');
INSERT INTO `event` VALUES (13,'UNSW','Foundation

University council''s first meeting in 1949
The origins of the university can be traced to the Sydney Mechanics'' School of Arts established in 1833 and the Sydney Technical College established in 1878.[5] These institutions were established to meet the growing demand for capabilities in new technologies as the New South Wales economy shifted from its pastoral base to industries fueled by the industrial age.[5]

The idea of founding the university originated from the crisis demands of World War II, during which the nation''s attention was drawn to the critical role that science and technology played in transforming an agricultural society into a modern and industrial one.[6] The post-war Labor government of New South Wales recognised the increasing need to have a university specialised in training high-quality engineers and technology-related professionals in numbers beyond that of the capacity and characteristics of the existing University of Sydney.[6] This led to the proposal to establish the Institute of Technology, submitted by the then New South Wales Minister for Education Bob Heffron, accepted on 9 July 1946.

The university, originally named the "New South Wales University of Technology", gained its statutory status through the enactment of the New South Wales University of Technology Act 1949 (NSW) by the Parliament of New South Wales in Sydney in 1949.

Early years
In March 1948, classes commenced with a first intake of 46 students pursuing programs including civil engineering, mechanical engineering, mining engineering and electrical engineering.[7] At that time the thesis programs were innovative. Each course embodied a specified and substantial period of practical training in the relevant industry. It was also unprecedented for tertiary institutions at that time to include compulsory instruction in humanities.[8]

Initially, the university operated from the inner Sydney Technical College city campus in Ultimo. However, in 1951, the Parliament of New South Wales passed the New South Wales University of Technology (Construction) Act 1951 (NSW) to provide funding and allow buildings to be erected at the Kensington site where the university is now located.

Expansion
In 1958, the university''s name was changed to the "University of New South Wales" to reflect its transformation from a technology-based institution to a generalist university. In 1960, it established faculties of arts and medicine and shortly after decided to add the Faculty of Law, which came into being in 1971.[9]

The university''s first director was Arthur Denning (1949–1952), who made important contributions to founding the university. In 1953, he was replaced by Philip Baxter, who continued as vice-chancellor when this position''s title was changed in 1955.[10] Baxter''s dynamic, if authoritarian, management was central to the university''s first 20 years. His visionary, but at times controversial, energies saw the university grow from a handful to 15,000 students by 1968.[11] The new vice-chancellor, Rupert Myers (1969–1981), brought consolidation and an urbane management style to a period of expanding student numbers, demand for change in university style and challenges of student unrest.

The stabilising techniques of the 1980s managed by the vice-chancellor, Michael Birt (1981–1992),[12] provided a firm base for the energetic corporatism and campus enhancements pursued by the subsequent vice-chancellor, John Niland (1992–2002). The 1990s saw the addition of fine arts to the university. The university established colleges in Newcastle (1951) and Wollongong (1961), which eventually became the University of Newcastle and the University of Wollongong in 1965 and 1975 respectively.

Recent history
In 2012 private sources contributed 45% of the University''s annual funding.[13]

The university is home to the Lowy Cancer Research Centre, one of Australia''s largest cancer research facilities. The centre, costing $127 million, is Australia''s first facility to bring together researchers in childhood and adult cancer.[14][15]

In 2003, the university was invited by Singapore''s Economic Development Board to consider opening a campus there. Following a 2004 decision to proceed, the first phase of a planned $200 m campus opened in 2007. Students and staff were sent home and the campus closed after one semester following substantial financial losses.[16]

In 2019, the university will move to a trimester timetable as part of UNSW''s 2025 Strategy.',0,'2019-10-01 00:12:00.000000','2020-01-01 01:55:00.000000',1234,'seminar');
INSERT INTO `event` VALUES (14,'Event','111',0,'2018-01-01 01:01:00.000000','2018-01-01 01:40:00.000000',1234,'course');
INSERT INTO `event` VALUES (15,'123','sdfasdf',0,'2016-01-01 01:01:00.000000','2016-01-01 13:01:00.000000',1234,'course');
INSERT INTO `event` VALUES (16,'test seminar','hello',0,'2016-01-01 01:01:00.000000','2016-01-01 01:59:00.000000',1234,'seminar');
INSERT INTO `event` VALUES (17,'test event','hello world',0,'2019-05-01 10:10:00.000000','2019-05-01 10:30:00.000000',1234,'course');
INSERT INTO `event` VALUES (18,'test seminar','hey ',0,'2019-01-01 01:00:00.000000','2019-10-01 01:50:00.000000',1234,'seminar');
INSERT INTO `event` VALUES (19,'Henry','sdfdf',0,'2018-05-10 10:00:00.000000','2018-05-12 12:00:00.000000',1234,'course');
INSERT INTO `event` VALUES (20,'testingtesting','ihihih',0,'2019-01-10 05:05:00.000000','2019-06-11 05:06:00.000000',1234,'seminar');
INSERT INTO `event` VALUES (21,'hello','hhhh',0,'2018-10-10 01:01:00.000000','2018-10-10 02:02:00.000000',1234,'course');
INSERT INTO `event` VALUES (22,'tttt','sdfadsf',0,'2018-11-05 18:00:00.000000','2018-11-06 17:30:00.000000',1234,'course');
INSERT INTO `event` VALUES (23,'History','Recent history
In 2012 private sources contributed 45% of the University''s annual funding.[13]

The university is home to the Lowy Cancer Research Centre, one of Australia''s largest cancer research facilities. The centre, costing $127 million, is Australia''s first facility to bring together researchers in childhood and adult cancer.[14][15]

In 2003, the university was invited by Singapore''s Economic Development Board to consider opening a campus there. Following a 2004 decision to proceed, the first phase of a planned $200 m campus opened in 2007. Students and staff were sent home and the campus closed after one semester following substantial financial losses.[16]

In 2019, the university will move to a trimester timetable as part of UNSW''s 2025 Strategy.

Symbols
The Grant of Arms was made by the College of Arms on 3 March 1952. The grant reads:

Argent on a Cross Gules a Lion passant guardant between four Mullets of eight points Or a Chief Sable charged with an open Book proper thereon the word "SCIENTIA" in letters also sable.[17]
The lion and the four stars of the Southern Cross on the St George''s Cross have reference to the State of New South Wales which established the university; the open book with scientia ("knowledge") across its pages is a reminder of its purpose. The placement of scientia on the book was inspired by its appearance on the arms of the Imperial College of Science, Technology and Medicine formed in 1907. Beneath the shield is the motto Manu et Mente ("With hand and mind"), which was the motto of the Sydney Technical College from which the university developed.[18]

An update of the design and colours of the arms was undertaken in 1970, which provided a more contemporary design, yet retained all the arms'' heraldic associations. In 1994 the university title was added to the UNSW arms, as was the abbreviation "UNSW", to create the UNSW symbol which is used for everyday and marketing purposes.[18]

The ceremonial mace of the university is made of stainless steel with silver facings and a shaft of eumung timber. On the head are mounted four silver shields, two engraved with the arms of the State of New South Wales and two with the original-design arms of the university. A silver Waratah, NSW''s floral emblem, surmounts the head. The mace was donated to the university by Broken Hill Proprietary Company Limited and was presented by the company''s chairman, Colin Syme, on 6 December 1962.[19] A former NSW Government Architect, Cobden Parkes, was appointed as the first official mace-bearer.[20]

Campus
See also: UNSW Venues

Quadrangle Building
The main UNSW campus, where most faculties are situated, is in Kensington, Sydney. UNSW Art & Design is located in the inner suburb of Paddington, and UNSW Canberra at ADFA is situated in Canberra.

The main UNSW campus is divided geographically into two areas: upper campus and lower campus. The lower campus area was vested in the university in two lots in December 1952 and June 1954. The upper campus area was vested in the university in November 1959.[21] These two are separated mainly by an elevation rise between the quadrangle and the Scientia building. It takes roughly fifteen minutes to walk from one extreme to the other.

UNSW also has Ucroo''s Digital Campus which seamlessly and intelligently connects the university body.

The university also has additional campuses and field stations in Randwick, Coogee, Botany, Dee Why, Cowan, Manly Vale, Fowlers Gap, Albury, Port Macquarie, Coffs Harbour and at Bankstown Airport.


Library Lawn, upper campus
The university has a number of purpose-built research facilities, including:

UNSW Lowy Cancer Research Centre is a facility at the university. It is Australia''s first facility bringing together researchers in childhood and adult cancers as well as one of the country''s largest cancer research facilities, housing up to 400 researchers.
The Mark Wainwright Analytical Centre is a centre for the faculties of science, medicine and engineering. It is used to study the structure and composition of biological, chemical and physical materials.
There are a number of theatre and music venues at the university, many of which are available for hire to the general public. The UNSW Fitness and Aquatic Centre provides health and fitness facilities and services to both students and the general public.[22][23]',0,'2018-08-02 13:00:00.000000','2018-08-07 22:00:00.000000',1234,'seminar');
INSERT INTO `event` VALUES (24,'last','hihi',0,'2018-12-31 06:00:00.000000','2019-01-01 19:00:00.000000',1234,'course');
INSERT INTO `event` VALUES (25,'TESTING course','Course Summary
This course provides an introduction to software engineering principles: software life-cycle concepts, modern development methodologies including XP, Scrum etc., conceptual modeling and how these activities relate to programming. The students are exposed to agile software practices, team collaboration and effective communication through implementing a group project based on agile software methodologies that requires them to analyse, design, build and deploy a web-based application. This course is typically taken in the semester after completing COMP 1511, but could be delayed and taken later. It provides essential background for the teamwork and project management required in many later courses.

The goal of this course is to expose the students to:

basic elements of software engineering - derived from the life-cycle of a software system, including requirements elicitation, analysis and specification; design; construction; verification and validation; deployment;
software engineering methodologies, processes, tools and techniques
agile software, collaboration and communication practices
web-based system architecture and development practices on web platforms
Assumed Knowledge
We assume that students have taken a first programming course, which has included:

ability to write simple programs in a programming language e.g. C and are familiar with loop structures, defining and invoking functions and returning results
exposure to a moderate-sized, team-based project and some testing/debugging ideas
These are assumed to have been acquired in COMP 1511.

Student Learning Outcomes
After completing this course, students will be able to: 
identify the complexities of software design and development
describe the phases of software development and life-cycle of software - and illustrate them from experience
analyse a problem domain and elicit user requirements
understand object oriented (OO) design principles and develop domain models applying OO based domain modelling techniques
understand and apply good software design principles and use a design paradigm to design a software system based on best practices
demonstrate effective usage of testing fundamentals (e.g., unit tests, integration tests, test plan/cases, test automation)
conceptual data modelling based on ER models, develop simple ER based data models
reflect on the choice of software engineering methodology (e.g, waterfall, RUP, agile) used in a project
understand agile software development practices and conducting analysis, design, implementation and testing in the context of an agile framework
describe common behavior that contribute to the effective functioning of a team and identify necessary roles in a software development team based on agile software practices
understand and apply GitHub as a source code management tool and as a medium for collaborating in the development of software applications
get some exposure to software non functional requirements (e.g., security)',0,'2018-06-02 12:00:00.000000','2018-06-02 16:00:00.000000',1234,'course');
INSERT INTO `event` VALUES (26,'sem1','Teaching Strategies and Rationale
This course uses the standard set of practice-focused teaching strategies employed by most CSE foundational courses:

Lectures
Tutorials and Lab sessions
Assignments .. will be in the form of both individual assignment, a team-based project and online quizz
This course aims to provide the students with a strong foundation in the fundamental principles and practices of software engineering that will prepare them for the advanced software engineering workshops. As such, a broad range of key software engineering topics will be taught and reinforced through an individual assignment and a group project, that will enable students to apply the theoretical concepts acquired to solve a practical software engineering problem. An agile software delivery style has been chosen for the implementation of the group project, to make students familiar with modern agile development methodologies.

Lectures
Lectures will be used to present the theory and practice of the techniques in this course. Although the lectures will primarily focus on the key concepts of software engineering, some lectures will also include practical demonstrations of various key technologies required for the implementation of the group project. Lecture notes will be available on the course web page.

Tutorials and Lab Sessions
Each tutorial_lab_session will comprise a 1 hour tutorial followed by a 2 hour practical lab session. These sessions commence from week 2 .

Tutorials will serve two purposes: (1) clarify ideas from lectures and work through exercises based on the lecture material (2) provide practical demonstrations in the tools and languages that students would need to learn to implement their group project. You should make sure that you use them effectively by examining in advance the material to be covered in each week''s tutorial, by asking questions, by offering suggestions and by generally participating. The tutorial questions will be posted on the Web in the week before each tutorial. Attendance at the tutorial is compulsory and tutorial participation will constitute 2 % of the overall course mark.

Following the tutorial class each week, there will be a two-hour laboratory class . The nature of the activities carried out in the lab sessions will vary each week. Lab sessions will comprise design and a variety of small practical exercises involving the tools and frameworks introduced during the lectures. These exercises will be released in the week preceding the lab class. Completed solutions (source-code, design artifacts etc) to each week''s lab exercise MUST be uploaded to GitHub. Your tutor will not award any marks for the lab exercise if the completed solution is not uploaded to GitHub. In addition, some lab exercises may require submission through the GIVE submission system. Details of due-date for the lab exercise and submission details will be outlined in each week''s lab specification.

Most weeks, the lab exercises will involve tasks that are to be completed individually. Some lab sessions may be done in pairs, where you and partner will be "pair programming". Pair programming is an activity in agile software development activity, where one person is coding and the other person reviews if the software delivers the required goals. A pair-programming session will typically involve multiple exercises to enable you and your partner to swap the roles of the "coder" and "reviewer". You and you partner should discuss the exercises before going to the lab, to maximise the usefulness of the class and decide on the role you will be taking.

Summary: to obtain any lab marks for the Week X lab, you must do 2 things: 
upload your completed solution to GitHub
demonstrate your work to your tutor in the lab class in the week it is due OR submit online through GIVE by the due-date . For pair-programming sessions, you should demonstrate as a pair to your tutor during the lab . Pair-programming exercises cannot be demonstrated by only one student, each pair member must take turns .
You cannot obtain marks by e-mailing lab work to tutors. Your tutor will provide feedback during a lab session on your approach to the problem and on the style of your solution. All labs must normally be demonstrated OR submitted by the due-date. Your tutor may grant you an extension on the lab exercise if you have been unable to complete the lab exercise due to illness or unavoidable circumstances (e.g, jury duty)

Periodically, the lab sessions will also be used to schedule demonstrations of your ongoing group project. As the implementation of the group project will be based on an agile software development methodology , you will required to demonstrate (as a team) progress of your project in iterations. No excuses will be accepted (unless unavoidable circumstances) for some members of the team not being present for the iteration demo.

As this course is has a significant practical component, laboratory classes are important to help you acquire the necessary skills in the relevant tools and frameworks that will be used in the implementation of the group project and also prepare you for the final exam. If you do not put a good amount of effort into the lab classes you risk failing the group project and the final exam.

The practical lab sessions will contribute to 10% of your overall course mark. The mark for iteration demonstration of the group project will go towards the mark allocated for your group project. 
Use of GitHub will be strongly enforced in this course, as using GitHub as the medium of team collaboration and source control is a key learning outcome that will be applied by students in several following courses through their degree.

',0,'2018-06-30 17:00:00.000000','2018-07-30 21:00:00.000000',1234,'seminar');
CREATE TABLE IF NOT EXISTS `attendance` (
	`user_id`	INTEGER NOT NULL,
	`session_id`	INTEGER NOT NULL,
	FOREIGN KEY(`session_id`) REFERENCES `session`(`id`),
	FOREIGN KEY(`user_id`) REFERENCES `user`(`id`),
	PRIMARY KEY(`user_id`,`session_id`)
);
INSERT INTO `attendance` VALUES (1234,1);
INSERT INTO `attendance` VALUES (6120002,2);
INSERT INTO `attendance` VALUES (6120003,3);
INSERT INTO `attendance` VALUES (1234,4);
INSERT INTO `attendance` VALUES (1234,5);
INSERT INTO `attendance` VALUES (1234,6);
INSERT INTO `attendance` VALUES (4119994,7);
INSERT INTO `attendance` VALUES (4119988,8);
INSERT INTO `attendance` VALUES (6120007,9);
INSERT INTO `attendance` VALUES (1234,10);
INSERT INTO `attendance` VALUES (1234,11);
INSERT INTO `attendance` VALUES (4119992,12);
INSERT INTO `attendance` VALUES (1234,13);
INSERT INTO `attendance` VALUES (1234,14);
INSERT INTO `attendance` VALUES (4119993,15);
INSERT INTO `attendance` VALUES (1234,16);
INSERT INTO `attendance` VALUES (1234,17);
INSERT INTO `attendance` VALUES (1234,18);
INSERT INTO `attendance` VALUES (1234,19);
INSERT INTO `attendance` VALUES (1234,20);
INSERT INTO `attendance` VALUES (1234,21);
INSERT INTO `attendance` VALUES (1234,22);
INSERT INTO `attendance` VALUES (6120008,23);
INSERT INTO `attendance` VALUES (1234,24);
INSERT INTO `attendance` VALUES (1234,25);
INSERT INTO `attendance` VALUES (6120007,26);
INSERT INTO `attendance` VALUES (1234,27);
INSERT INTO `attendance` VALUES (1234,28);
INSERT INTO `attendance` VALUES (1234,29);
INSERT INTO `attendance` VALUES (6120002,30);
INSERT INTO `attendance` VALUES (1234,31);
INSERT INTO `attendance` VALUES (4119990,33);
INSERT INTO `attendance` VALUES (6120003,34);
COMMIT;
