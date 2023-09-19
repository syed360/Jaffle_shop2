with source as( 
   select * from  {{ source('artist_source' , 'artist_data')}}
)
select * from source