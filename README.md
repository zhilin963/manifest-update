# Manifest Update
Smart contract written in Solidity

## 1. Description
A smart contract for IoT device to update its local manifest file. The smart contract ensures that only the latest version of a specific manifest can be downloaded to the local device. Moreover, the publisher of this manifest must be a specific Licensee as well.  

## 2. Operations
Licensee generates the latest version of a manifest file, then uploads it to blockchain via a smart contract. Periodically, the device requests for the latest version of this manifest via the same smart contract. If the latest version is available, the device downloads it to local storage. To achieve this functionality, Licensee programs the smart contract **manifestUpdate.sol**, then deploys it on Ethereum blockchain.
<div align=center><img width="600" height="300" src="https://github.com/zhilin963/manifest-update/blob/main/IMG/framework.jpg" />  </div>  

* **Manifest Upload**  
Licensee generates the latest manifest, upload it to blockchain via a smart contract, which records the name, the version number and the content of manifest. In addition, the smart contract also checks whether the identity of the publisher is the specific Licensee.
* **Sending Request**  
Device sends the update request periodically to the blockchain. The request must contain the address, version number, and file name of the device.
* **Manifest Download**  
The smart contract receives the request, then checks the name, the address and the existing manifest version of the device. If the existing manifest of device is not the latest, moreover, the latest version is available, then the device can download the latest manifest through this smart contract.

## 3. Functional Design
<div align=center><img width="300" height="500" src="https://github.com/zhilin963/manifest-update/blob/main/IMG/contract2.jpg" />  </div>  

**modifier isVendor()**: check if the message sender is the Licensee.  
**modifier checkName()**: check if the file name is correct.  
**modifier checkVersion()**: check if the manifest version is the latest.  
**uploadManifest()**: upload each parameter of the latest manifest.  
 <div align=center><img width="600" height="400" src="https://github.com/zhilin963/manifest-update/blob/main/IMG/function1.png" />  </div>  
 
**getManifest()**: get the actual version of manifest.  

**downloadManifest()**: download the latest manifest if available.  
<div align=center><img width="600" height="500" src="https://github.com/zhilin963/manifest-update/blob/main/IMG/function2.png" />  </div>    
