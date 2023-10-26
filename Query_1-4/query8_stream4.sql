select  s_store_name
      ,sum(ss_net_profit)
 from store_sales
     ,date_dim
     ,store,
     (select ca_zip
     from (
      SELECT substr(ca_zip,1,5) ca_zip
      FROM customer_address
      WHERE substr(ca_zip,1,5) IN (
                          '71960','11044','36518','92261','34584','31042',
                          '64013','65961','30413','80029','55880',
                          '30278','60371','52519','45686','94796',
                          '32232','70198','13825','51930','98089',
                          '96245','91560','12303','86458','24900',
                          '44525','26200','20729','87629','65332',
                          '31691','86168','70365','30647','42266',
                          '32746','53761','83241','27325','77187',
                          '45380','51623','47311','82643','86666',
                          '23012','95299','65784','12062','12194',
                          '55662','52117','42021','44812','48392',
                          '59115','55162','24029','11493','31642',
                          '67370','96948','34128','89884','23073',
                          '65427','26385','90117','14985','84181',
                          '40234','61701','30887','80829','38956',
                          '78287','57864','72127','77751','20763',
                          '31658','74746','70854','40654','46814',
                          '80798','37391','22781','96215','92650',
                          '49090','65562','97223','21171','90294',
                          '93158','65355','16623','45841','51844',
                          '43616','59138','80428','76816','65766',
                          '16405','33273','54244','56044','65744',
                          '38512','58909','68467','78062','53161',
                          '32668','75842','84389','29711','19991',
                          '44215','20898','53544','99146','33351',
                          '25187','22006','14464','45284','11841',
                          '48771','86686','84315','53658','31951',
                          '62489','98708','96293','53974','19871',
                          '53159','41719','77871','14019','67807',
                          '64586','75393','34184','46222','98834',
                          '21917','44362','57329','10430','49858',
                          '97293','70167','44662','77992','54515',
                          '22327','84146','93828','55869','12909',
                          '51979','36729','30790','14462','58377',
                          '93539','77465','67867','21796','72640',
                          '43178','71084','52737','60748','93277',
                          '13770','99283','78280','54773','34091',
                          '86637','22711','48324','45704','83884',
                          '76215','55142','87216','94212','69085',
                          '21634','99096','65273','76860','20831',
                          '12074','96650','33668','64367','64831',
                          '43557','82771','99382','99862','53834',
                          '56713','50436','19032','41633','79860',
                          '25816','36551','47937','60484','90726',
                          '56287','50691','42560','39223','71429',
                          '83868','13783','97865','63375','36794',
                          '39397','78573','31189','22658','46316',
                          '17094','54742','84595','13644','99447',
                          '11948','49284','62471','52916','71245',
                          '16511','17877','39914','62756','54803',
                          '36467','82598','36497','69856','72448',
                          '32326','14850','32161','40437','74468',
                          '17313','27926','16158','87542','27546',
                          '98662','56366','47891','35521','25095',
                          '76346','11546','40793','74103','58851',
                          '52948','76336','21427','91300','72522',
                          '66547','55127','81040','86555','39842',
                          '28576','54589','44463','93876','31051',
                          '86842','14018','67107','34391','96372',
                          '47710','54082','93082','70581','10139',
                          '82198','96811','86174','64253','38119',
                          '34558','22418','21355','23588','62161',
                          '75270','60241','83712','34039','30363',
                          '67985','73516','64509','95891','53830',
                          '67592','59968','82801','39610','21609',
                          '79757','33371','30017','37084','91753',
                          '32424','18757','14501','18923','26310',
                          '79912','10704','93525','32452','72921',
                          '34836','88366','93477','88550','10861',
                          '90753','61335','45211','17720','25863',
                          '83189','43081','11603','67829','13071',
                          '77486','52974','63282','33496','75049',
                          '70221','66386','40085','92931','48703',
                          '12185','23806','48708','62096','29238',
                          '12684','79771','64186','76380','32642',
                          '43688','92994','32175','34030','75988',
                          '71389','59625','68014','29637','59355',
                          '94636','17935','16622','51592','26442',
                          '10775','99835','30157','95845','41449',
                          '10003','56955','24116','94219')
     intersect
      select ca_zip
      from (SELECT substr(ca_zip,1,5) ca_zip,count(*) cnt
            FROM customer_address, customer
            WHERE ca_address_sk = c_current_addr_sk and
                  c_preferred_cust_flag='Y'
            group by ca_zip
            having count(*) > 10)A1)A2) V1
 where ss_store_sk = s_store_sk
  and ss_sold_date_sk = d_date_sk
  and d_qoy = 1 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;