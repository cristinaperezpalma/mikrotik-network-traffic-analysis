
#!/bin/bash



for file in /home/operador/Escritorio/nfcapd/nfcapd* 


do
   nfdump -r $file -o csv -A  srcip,dstip '(src ip 33.1.1.1 or src ip 33.3.1.2) and (dst ip 33.1.2.3 or dst ip 33.1.2.4)' >> /home/operador/Escritorio/flujos/Flujo_1_2

nfdump -r $file -o csv -A  srcip,dstip '(src ip 33.1.1.1 or src ip 33.3.1.2) and (dst ip 33.1.3.5 or dst ip 33.1.3.6 or dst ip 33.1.3.7)' >> /home/operador/Escritorio/flujos/Flujo_1_3

  nfdump -r $file -o csv -A srcip,dstip '(src ip 33.1.2.3 or src ip 33.1.2.4) and (dst ip 33.1.1.1 or dst ip 33.1.1.2)' >> /home/operador/Escritorio/flujos/Flujo_2_1

nfdump -r $file -o csv -A  srcip,dstip '(src ip 33.1.2.3 or src ip 33.1.2.4) and (dst ip 33.1.3.5 or dst ip 33.1.3.6 or dst ip 33.1.3.7)' >> /home/operador/Escritorio/flujos/Flujo_2_3

  nfdump -r $file -o csv -A  srcip,dstip '(src ip 33.1.3.5 or src ip 33.1.3.6 or src ip 33.1.3.7) and (dst ip 33.1.1.1 or dst ip 33.1.1.2)' >> /home/operador/Escritorio/flujos/Flujo_3_1

  nfdump -r $file -o csv -A  srcip,dstip '(src ip 33.1.3.5 or src ip 33.1.3.6 or src ip 33.1.3.7) and (dst ip 33.1.2.3 or dst ip 33.1.2.4)' >> /home/operador/Escritorio/flujos/Flujo_3_2

done

echo "programa terminado."




