# How it works

## Hackathon organizer deploys the contract
- Hackathon name and organizer address are immutable.They cannot be changed after deployment.

## Sponsors creates and deposit prizes 
- Sponsor submits the name of the prize and transfers the amount of prize at the time of prize creation. Additional metadata about prize can be added to the Prize struct.

## Hackathon evaluation process happens off-chain
- Like it always has been

## Hackathon organizer starts distribution
- After the results come out, organizer starts the distribution process by submitting winner's address for each prize.

## Sponsor verifes the nominees
- Sponsors submits the winner's address for each of their prizes.

## Nominees withdraw their prizes
- If both sponsor's and organizer's winner address match, winner can withdraw the prize from the contract.

