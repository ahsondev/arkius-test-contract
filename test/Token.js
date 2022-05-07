const { expect } = require('chai')
const { ethers } = require('hardhat')

let owner, addr1, addr2, addr3
let Token
let token

let provider = ethers.getDefaultProvider()

beforeEach(async function() {
  ;[owner, addr1, addr2, addr3] = await ethers.getSigners()
  Token = await ethers.getContractFactory('ATNFTNft')

  const baseUri = process.env.BASE_URI
  console.log('baseUri: ', baseUri)
  token = await Token.deploy('ATNFTNFT', 'ATNFT', baseUri)
  await token.addWhiteLists([owner.address])
})

describe('Token contract', function() {
  it('ATNFTNft token test', async function() {
  })
})
