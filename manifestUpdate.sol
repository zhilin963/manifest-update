pragma solidity >=0.4.22 <0.7.0;

contract manifestUpdate{
    address public vendor;
    address public device;
    struct Manifest{
        int version;
        string name;
        string ipfs_hash;
        mapping(address=>Manifest) map;
        
    }
    Manifest manifest;
 
    constructor() public {
        vendor = msg.sender;
    }
    
    // check if it is the software vendor
    modifier isVendor{
        require(msg.sender == vendor, "You are not the software vendor!");
        _;
    }
    
    // check the name of manifest file
    modifier checkName(string memory file_name){
        require(keccak256(abi.encodePacked((file_name))) == keccak256(abi.encodePacked((manifest.name))), "No Such Update!");
        _;
    }
    
    // check the version of manifest file
    modifier checkVersion(int file_version){
        require(file_version < manifest.version, "No Update Available!");
        _;
    }
    
    function uploadManifest(int version_value, string memory name_value, string memory hash_value) public isVendor {
        //Manifest memory m = Manifest(version_value, name_value, hash_value);
        //manifest.map[msg.sender] = m;
        manifest.version = version_value;
        manifest.name = name_value;
        manifest.ipfs_hash = hash_value;
    }
    
    //get the information of manifest file
    function getManifest() public view returns (int, string memory, string memory){
        return (manifest.version, manifest.name, manifest.ipfs_hash);
    }
    
     function downloadManifest(int version_value, string memory name_value) public checkVersion(version_value) checkName(name_value) {
        manifest.map[msg.sender].version = manifest.version;
        manifest.map[msg.sender].ipfs_hash = manifest.ipfs_hash;
    }
    
}
