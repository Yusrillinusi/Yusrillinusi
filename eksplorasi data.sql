#Total pendapatan berdasarkan kategori produk untuk setiap kombinasi kategori produk dan sub kategori
select distinct
	Product_category, (sub_category) as product_detail, count(*) as jumlah_pesanan, sum(profit) as total_pendapatan
from 
 newschema.sales
group by Product_category, sub_category, profit
order by total_pendapatan desc


#pendapatan rata-rata pertransaksi berdasarkan negara dan produk kategori untuk setiap negara dan kategori produk
select
	country, product_category, AVG(revenue) as pendapatan_rata_rata_per_transaksi
from 
 newschema.sales
group by country, product_category

#analisa distribusi umur pelanggan 
select 
	Age_group,
    count(*) as jumlah_pelanggan
from 
	newschema.sales
group by Age_group

# Total profit dan biaya per produk subkategori (menganalisis total profit dan biaya untuk setiap kategori produk
select 	
	Sub_category, sum(profit) as total_profit, sum(cost) as total_biaya
from 
	newschema.sales
group by Sub_category

#jumlah transaksi perbulan berdasarkan customer age 
select
	customer_age, extract(month from date) as bulan, customer_gender, date,
    count(*) as jumlah_transaksi
from 
	newschema.sales
group by Customer_age, date
order by jumlah_transaksi desc

#rata_rata_umur pelanggan perjenis kelamin
select
	customer_gender, avg(customer_age) as rata_rata_umur
from 
	newschema.sales
group by customer_gender;

#Total profit dan biaya perkategori produk
select
	product_category, sum(profit) as total_profit,
    sum(cost) as total_biaya
from 
	newschema.sales
group by product_category;

#produk dengan pendapatan tertinggi pernegara (menemukan produk dengan pendapatan tertinggi untuk setiap negara
select 
	country, Product, max(revenue) as pendapatan_tertinggi
from 
	newschema.sales
group by country, product
order by pendapatan_tertinggi desc
limit 10

#Top 3 negara dengan dsitribusi pendapatan tertinggi
Select
	country, sum(profit) as total_pendapatan
from
	newschema.sales
group by country
order by total_pendapatan desc
limit 3

#produk dengan persentase profit tertinggi
select
	product, (sum(profit) / sum(revenue)) * 100 as persentase_profit
from
	newschema.sales
group by product
order by persentase_profit desc

# Rata-rata Harga satuan PRoduk per subkategori (menghitung rata-rata harga satuan untuk setiap subkategori produk
select
	sub_category, round(avg(unit_price)) as Rata_rata_harga_satuan
from 
	newschema.sales
group by sub_category
order by Rata_rata_harga_satuan desc

#analisis jumlah transaksi perjenis kelamin
select
	customer_gender, count(*) as jumlah_transaksi
from
	newschema.sales
group by customer_gender 
order by jumlah_transaksi desc

#tren waktu penjualan produk kategori tertentu (bulan 3 menjadi tren pemebelian tertinggi dan bulan 
Select 
	extract(month from date) as Month, product_category, sum(order_quantity) as total_pesanan
from
	newschema.sales
#where product_category like '%R%'
group by date, product_category
order by total_pesanan desc

#analisis korelasi (menilai korelasi antara dua variabel) misal total penjualan dan jumlah item

#pencarian outliers
Select 
	extract(month from date) as Month, order_quantity
from
	newschema.sales 
where 
	order_quantity > 2 * (select avg(order_quantity)
    from newschema.sales);
	
 


	






	

    

    