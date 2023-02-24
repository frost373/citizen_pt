import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor() ERC20("DiaoMaoCoin", "DMC") {}
    mapping(string   => User )  userInfo;
    mapping(string  => address)  user_address;
    mapping(address => string )  address_user;

    struct User {
        string info; // weight is accumulated by delegation
        address add; // person delegated to
    }

     function getUser(string memory userId)  public returns (User memory) {
        return userInfo[userId];
    }

    function addUser(string memory userId,string memory  user_i,address user_a) public{
            User  memory user = User(user_i,user_a);
            userInfo[userId]= user;
            user_address[userId] = user_a;
            address_user[user_a] = userId;
    }

        
     function safeMint(address to, uint256 amount) public  {
        _mint(to, amount);
    }
}
