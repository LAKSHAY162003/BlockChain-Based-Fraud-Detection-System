// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GrantAllocationSystem {
    struct GrantEntry {
        uint256[28] features;
        uint256 time;
        uint256 amount;
        uint8 class;
    }

    mapping(uint256 => GrantEntry) grants;
    uint256 public grantCount;

    /**
     * @dev Function to add a new grant entry.
     * @param _features Array of 28 uint256 values representing features V1 to V28.
     * @param _time Timestamp representing the time of the grant.
     * @param _amount Amount of the grant.
     * @param _class Class of the grant (0 for Legitimate Transaction, 1 for Fraud Transaction).
     */
    function addGrantEntry(uint256[28] memory _features, uint256 _time, uint256 _amount, uint8 _class) public {
        uint256 grantId = grantCount++;
        grants[grantId] = GrantEntry(_features, _time, _amount, _class);
    }

    /**
     * @dev Function to edit an existing grant entry.
     * @param _grantId ID of the grant entry to be edited.
     * @param _features Array of 28 uint256 values representing features V1 to V28.
     * @param _time Timestamp representing the time of the grant.
     * @param _amount Amount of the grant.
     * @param _class Class of the grant (0 for Legitimate Transaction, 1 for Fraud Transaction).
     */
    function editGrantEntry(uint256 _grantId, uint256[28] memory _features, uint256 _time, uint256 _amount, uint8 _class) public {
        require(_grantId < grantCount, "Grant ID does not exist");
        grants[_grantId] = GrantEntry(_features, _time, _amount, _class);
    }

    /**
     * @dev Function to fetch details of a grant entry by ID.
     * @param _grantId ID of the grant entry to fetch.
     * @return features Array of 28 uint256 values representing features V1 to V28.
     * @return time Timestamp representing the time of the grant.
     * @return amount Amount of the grant.
     * @return class Class of the grant (0 for Legitimate Transaction, 1 for Fraud Transaction).
     */
    function getGrantEntry(uint256 _grantId) public view returns (uint256[28] memory features, uint256 time, uint256 amount, uint8 class) {
        require(_grantId < grantCount, "Grant ID does not exist");
        GrantEntry memory entry = grants[_grantId];
        return (entry.features, entry.time, entry.amount, entry.class);
    }
}
