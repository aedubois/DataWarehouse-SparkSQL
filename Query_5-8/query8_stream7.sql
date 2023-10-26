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
                          '33082','70076','88541','77906','97469','35223',
                          '25088','31277','25188','32983','60536',
                          '34015','27908','58095','34765','28400',
                          '96054','98680','88375','31376','85194',
                          '20169','20020','54553','34097','34769',
                          '10999','18549','55497','98245','15429',
                          '11006','98792','16663','79062','44804',
                          '18845','56046','17828','96457','67980',
                          '26184','84445','53465','55769','81893',
                          '93278','15871','63946','77587','11714',
                          '25401','41600','30833','15701','25284',
                          '32529','85919','87531','47106','20191',
                          '35416','21900','85431','45654','37522',
                          '28322','62437','97567','76572','99587',
                          '15081','15455','64052','50558','42696',
                          '26163','65763','68831','99305','71731',
                          '56817','34622','61673','59273','53076',
                          '94771','12343','69000','42122','75274',
                          '53594','48823','99433','82125','94069',
                          '48241','47394','59460','17079','16291',
                          '10440','31773','64630','19206','18797',
                          '21155','25031','10556','30750','70211',
                          '45197','28122','74816','76356','79627',
                          '30864','41568','71900','18138','64765',
                          '83532','98678','13436','48479','12558',
                          '93911','83928','47216','52927','12360',
                          '91989','30828','38927','64069','74821',
                          '94009','59881','87836','24742','57011',
                          '95611','42966','33184','86233','41154',
                          '56833','17649','36778','64341','83649',
                          '73084','87617','85159','41198','37263',
                          '41115','42752','58445','58951','34248',
                          '14483','21116','76784','23825','66538',
                          '25121','90124','79580','77635','10428',
                          '18193','37923','46424','87711','83841',
                          '13412','75943','80823','16252','80912',
                          '88686','59438','38680','81203','71313',
                          '32365','66465','31051','31318','25845',
                          '25252','17200','19605','82200','75841',
                          '39695','94008','60079','55277','35530',
                          '63846','52609','76988','78073','98994',
                          '95810','33621','52334','79223','78899',
                          '93015','91412','96937','10653','92011',
                          '37037','67841','98266','70134','93710',
                          '81520','34537','78656','48292','61816',
                          '29844','19587','58318','11543','97910',
                          '80883','30080','67682','56313','23935',
                          '55373','19572','28337','63177','47313',
                          '96747','17397','59516','75848','42327',
                          '14623','86882','79592','82520','80371',
                          '64874','33529','36053','96300','52570',
                          '63567','57091','57880','83744','93819',
                          '98953','10339','89749','28489','70108',
                          '81100','71776','31073','40788','83030',
                          '88557','11450','89852','23551','89108',
                          '53091','33589','21286','30521','46781',
                          '81574','86740','41686','81996','43346',
                          '75608','14570','70808','78103','81479',
                          '82089','37739','48466','28006','46831',
                          '15825','93062','29976','92031','16020',
                          '63176','51348','67634','79311','18740',
                          '83924','37605','20790','56566','37861',
                          '31644','74667','87202','35076','35055',
                          '49399','52768','48246','65048','56824',
                          '77005','51743','23440','73615','49121',
                          '37455','91578','71721','80851','28821',
                          '36678','63209','33626','68558','58525',
                          '66250','86400','84541','72155','53862',
                          '36030','95180','71537','33102','84991',
                          '29381','55534','41890','65327','61420',
                          '80171','32667','70349','54937','53731',
                          '16677','70224','81447','83699','61089',
                          '97748','94053','46181','80498','37122',
                          '38045','35365','44783','33405','65011',
                          '69192','89023','67578','93634','15227',
                          '12880','38714','20396','75576','24371',
                          '69571','28332','81888','32760','12737',
                          '68636','56301','99854','40396','70544',
                          '46297','12354','12719','21094','19400',
                          '44270','68855','79405','68548')
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
  and d_qoy = 2 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;
