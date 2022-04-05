use iSpan3

Create table Account(
AccountID  Integer Primary key Identity(1,1),
UserAccount  nvarchar(200) not null,
UserPassword nvarchar(2000) not null,
UserRole nvarchar(50) not null,
)



Create table User1(
UserID  Integer Primary key Identity(1000,1),
UserEmailAddress  nvarchar(200)not null,
NickName nvarchar(50)  null,
Birthday date null,
Phone nvarchar(50)  null,
Address nvarchar(50)  null,
)

Create table Store
(
StoreID  Integer Primary key Identity(1,1),
StoreName nvarchar(50)  null,
StoreCategory  nvarchar(50)  null,
StorePhone nvarchar(50)  null,
StoreAddress nvarchar(50) null,
StoreBusinessHours nvarchar(50)  null,
Preview image null,
StoreAccount nvarchar(50) not null,
)

Create table Product(
ProductID  Integer Primary key Identity(1,1),
ProductName nvarchar(50)  null,
ProductCategory  nvarchar(50)  null,
ProductUnitPrice Integer  null,
Preview image   null,
StoreID Integer not null,
FOREIGN KEY (StoreID) REFERENCES Store (StoreID),
)

Create table ProductTaste(
StoreID Integer not null,
TasteAdjustment nvarchar(50) null,
FOREIGN KEY (StoreID) REFERENCES Store (StoreID),
)

Create table TasteAdjustment(
TasteAdjustment nvarchar(50) null,
Options nvarchar(50) null,
)
Create table OrderStatus(
OrderStatus nvarchar(50) Primary key,)

Create table ProductOrder(
OrderID Integer Primary key Identity(1,1),
StoreID Integer not null,
UserID Integer not null,
OrderDate date null,
OrderStatus nvarchar(50) null,
FOREIGN KEY (StoreID) REFERENCES Store (StoreID),
FOREIGN KEY (UserID) REFERENCES User1 (UserID),
FOREIGN KEY (OrderStatus) REFERENCES OrderStatus (OrderStatus),
)

Create table OrderInformation(
OrderInformationID Integer Primary key Identity(1,1),
OrderID Integer not null,
ProductName nvarchar(50) not null,
Number Integer not null,
ProductUnitPrice Integer null,
ProductPrice Integer null,
Remark nvarchar(1000) null,
FOREIGN KEY (OrderID) REFERENCES ProductOrder (OrderID),
)


INSERT INTO Store
VALUES 
('眺吧餐酒館', '套餐', '071234645','800高雄市新興區中山一路14-26號RF樓','07:00–12:00、15:00–00:00',null,'admin2'),
('étage15 西餐廳', '排餐', '075362999','800高雄市新興區林森一路165號','1000-2400',null,'admin1'),
('覓奇頂級龍蝦和牛美食餐廳', '海鮮燒肉', '072695111','802高雄市苓雅區成功一路76號','11:00–14:30、17:00–22:00',null,'admin3'),
('安多尼歐', '法式料理', '075335330','803高雄市鹽埕區河西路7-1號','17:30–22:00',null,'admin4'),
('Lion義式餐酒館', '餐酒館', '073220036','807高雄市三民區山東街9號','17:00–00:00',null,'admin5'),
('Piano56 慢食悠活義式料理', '義大利菜', '073742393','814高雄市仁武區赤仁路56號','11:00–14:00、17:00–21:00',null,'admin6'),
('Ripple 義法西餐廳', '多國料理', '075537001','804高雄市鼓山區明華路366號','11:00–14:30、17:00–22:00',null,'admin7'),
('水岩 真料理', '火鍋', '075866228','804高雄市鼓山區美術東二路265號','11:30–14:00、18:00–21:00',null,'admin8'),
('1928燒肉總鋪-鳳山店', '燒肉', '077802227','830高雄市鳳山區青年路二段456號','11:30–01:30',null,'admin9');




INSERT INTO Product
VALUES
('凱薩沙拉', '沙拉', '290',null,'1'),
('酥炸雞翅鑲蝦漿', '炸物', '290',null,'1'),
('西班牙番紅花海鮮燉飯', '飯類', '490',null,'1'),
('牛小排', '排餐', '930',null,'1'),
('帝王蟹肉洋芋濃湯', '湯品', '290',null,'1'),
('四季野蔬蕈菇義大利麵', '義大利麵', '350',null,'1'),
('精選布丁', '甜點', '99',null,'1'),
('威士忌冰淇淋', '甜點', '199',null,'1'),


('鮭魚子', '前菜', '250',null,'3'),
('安康魚肝醋', '沙拉', '250',null,'3'),
('鱈場蟹腳沙拉', '沙拉', '320',null,'3'),
('日本生海膽天婦羅', '炸物', '500',null,'3'),
('波士頓龍蝦', '主食', '1380',null,'3'),
('極黑金牌和牛', '主食', '1380',null,'3');