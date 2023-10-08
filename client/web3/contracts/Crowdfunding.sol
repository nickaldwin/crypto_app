// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
        /*make a class first*/
contract Crowdfunfing {
    struct Campaign {
        address: owner;
        string: title;
        string: description;
        uint256: target;
        uint256: deadline;
        uint256: ammountCollected;
        string: image;
        address: [] donators;
        uint256: [] donations;   
    }
     /*campaign[0];*/

    mapping(uint256 => Campaign) public campaigns;

    uint256 public numberOfCampaigns = 0; /*public Variable*/

        /*create three functions*/
    function createCampaign(address_owner, string memory_title, string memory_description, uint256_target, uint256_deadline, string memory_image) public returns(uint256){
        Campaign storage campaign = campaigns [numberOfCampaigns];
        //to check is evrething ok

        require(campaign.deadline < block.timestamp, "the deadline should be a date in the future.");
        campaign.owner = _owner;
        campaign.title = _tilte;
        campaign.description = _description;
        campaign.target = _target;
        campaign.deadline = _deadline;
        campaign.ammountCollected = 0;
        campaign.image = _image; 

        numberOfCampaigns++;

        return numberOfCampaigns - 1
    }

    function donateCampaign(uint256_id, ) public payable {
        uint256 amount = msg.value;

        campaign Storage campaign = campaigns [_id];

        campaign.donatiors.push(msg.sender);
        campaign.donations.push(amount);

        (bool sent,) = payable(campaign.owner).call{value:amount}();

        if (sent) {
            campaign.ammountCollected  = campaign.ammountCollected + amount;
        }
        
    }

    function getDonators(uint256_id) view public return (address[] memory, uint256[] memory){
        return(campaigns[_id].donatiors, campaign[_id].donations)
    }//return the mapping

    function getCampaign() public return(Campaign[] memory){
        Campaign[] memory allCampaign = new Campaign[](numberOfCampaigns);

        for (uint i = 0; i < numberOfCampaigns; i++) {
            Campaign storage item = campaigns[i]
            allCampaigns[i] = item;
        }

        return allCampaigns;

    }

}