
# Solana-Dockerized

Solana Doickerized 

https://solana.com/



# Instructions 

## 1. Build 

Build the image running 

```
./build.sh
```



## 2. Run 

Run the container for the image you have created above, mounting the external dir `PWD` in the internal dir `/project` running 

```
./run.sh
```



# 3. Test 

Once inside the container in `/project` to check the installation was successful run 

```
./test.sh
```

Expected output 

```
root@6d45a98c8ba8:/project# ./test.sh 
[2021-06-09T08:08:42.476281872Z DEBUG solana_runtime::message_processor] Program Vote111111111111111111111111111111111111111 invoke [1]
[2021-06-09T08:08:42.476337058Z DEBUG solana_runtime::message_processor] Program Vote111111111111111111111111111111111111111 success
[2021-06-09T08:08:42.881632829Z DEBUG solana_runtime::message_processor] Program Vote111111111111111111111111111111111111111 invoke [1]
[2021-06-09T08:08:42.881675141Z DEBUG solana_runtime::message_processor] Program Vote111111111111111111111111111111111111111 success
[2021-06-09T08:08:43.286906281Z DEBUG solana_runtime::message_processor] Program Vote111111111111111111111111111111111111111 invoke [1]
```






