MetaACO Core version 3.0.5 is now available from:

  <https://https://github.com/metaaco/MACO/releases>

This is a new minor-revision version release, including various bug fixes and
performance improvements, as well as updated translations.

Please report bugs using the issue tracker at github:

  <https://https://github.com/metaaco/MACO/issues>


Mandatory Update
==============

MetaACO Core v3.0.5 is a mandatory update for all users. This release contains various updates/fixes pertaining to the zMACO protocol, supply tracking, block transmission and relaying, as well as usability and quality-of-life updates to the GUI. Users are required to update before block `908000` which is when the accumulators will be refactored. Shortly after that block, zMACO transactions will be enabled. **When zMACO is enabled, autominting will also be enabled.** If you would like to disable automatic conversion of 10% of your MACO balance to zMACO, then you will need to add `enablezeromint=0` to your `metaaco.conf` file. For information about where to find your metaaco.conf you can visit this link from [MetaACO Support](https://t.me/antarescodes/support/solutions/articles/30000004664-where-are-my-wallet-dat-blockchain-and-configuration-conf-files-located-).

Users will have a grace period to update their clients before versions prior to this release are no longer allowed to connect to this (and future) version(s).


How to Upgrade
==============

If you are running an older version, shut it down. Wait until it has completely shut down (which might take a few minutes for older versions), then run the installer (on Windows) or just copy over /Applications/MetaACO-Qt (on Mac) or metaacod/metaaco-qt (on Linux).


Compatibility
==============

MetaACO Core is extensively tested on multiple operating systems using
the Linux kernel, macOS 10.8+, and Windows Vista and later.

Microsoft ended support for Windows XP on [April 8th, 2014](https://www.microsoft.com/en-us/WindowsForBusiness/end-of-xp-support),
No attempt is made to prevent installing or running the software on Windows XP, you
can still do so at your own risk but be aware that there are known instabilities and issues.
Please do not report issues about Windows XP to the issue tracker.

MetaACO Core should also work on most other Unix-like systems but is not
frequently tested on them.

### :exclamation::exclamation::exclamation: MacOS 10.13 High Sierra :exclamation::exclamation::exclamation:

**Currently there are issues with the 3.0.x gitian releases on MacOS version 10.13 (High Sierra), no reports of issues on older versions of MacOS. As such, a High Sierra Only version is included below.**


Notable Changes
===============

Accumulator Code Refactor
---------------------
The zMACO accumulator code has undergone a major refactor. Accumulators are one of the most essential components of the zerocoin protocol, and also one of the most computationally expensive parts of the protocol. This refactoring speeds up syncing and spending of zMACO by over 5x. The new code also allows for spending of zMACO with only 2 required mints occurring on the network after your mint has been added, whereas before 3 were required. This refactor allows for lighter resource load and a smoother user experience.

libzerocoin Exploit Fix
---------------------
zMACO relies on a 3rd party library called libzerocoin. All currencies that utilize the zerocoin protocol use libzerocoin, and many of those currencies have been exposed to an exploit which allowed for the creation of multiple zero-knowledge spending proofs for one single zerocoin mint.-2022 The MetaACO Coin developers were able properly identify the exploit, track down any fraudulent spending proofs, link the fraudulent spending proofs with their one valid proof that they were mutated from, and remove any mints from the accumulators that were derived from the invalid spends. 

zMACO Maintenance Mode Spork
---------------------
Handling the above noted libzerocoin exploit required the MetaACO team to immediately release a patched wallet to as many users as possible which rejected bad spends and also disabled all zMACO transactions in general. The process of releasing a patched wallet in such a small time frame is frustrating and difficult for all members of the MetaACO team and especially users of MetaACO.-2022 The MetaACO Coin developers have added a new spork which allows for zMACO transacting to be turned on/off without having to release a patched wallet. This will allow much smoother operation if any problems occur in the future, and should also allow exchanges and 3rd party services to continue to operate even if zMACO is in maintenance mode.

Money Supply Indexing
---------------------
The exploit in libzerocoin threw off some of the wallet's internal money supply calculations for both the zMACO supply and the MACO supply. User's wallet's will automatically recalculate the supply on block `908001`. User's also have the ability to recalculate supply using the startup flag `reindexmoneysupply`.

More Extensive Tracking of zMACO Supply Through RPC
---------------------
More information has been added to the `getinfo` and `getblock` RPC calls, which now display the total zMACO supply as well as the balance for each zMACO accumulator.

Multisig GUI
---------------------
Provides functionality which is currently only available through raw transactions. Multisignature addresses require signatures from multiple parties before coins belonging to the address are spent. Accessed through the File dropdown menu.


3.0.5 Change log
=================

Detailed release notes follow. This overview includes changes that affect
behavior, not code moves, refactors and string updates. For convenience in locating
the code changes and accompanying discussion, both the pull request and
git merge commit are mentioned.

### P2P Protocol and Network Code
- #339 `559492a` [Main] Refactor Accumulator Code (presstab)
- #390 `TBD` [MAIN] Libzerocoin patch (presstab)

### Wallet
- #308 `bd8a982` [Minting] Clear mempool after invalid block from miner (presstab)
- #316 `ed192cf` [Minting] Better filtering of zPiv serials in miner. (presstab)

### GUI
- #278 `46f4960` [QT] Multisignature GUI (rejectedpromise)
- #340 `6a4eef1` [QT] Show the current block in the progress bar. (presstab)
- #365 `c66d015` [UI] Rename SwiftTX -> SwiftX (Mrs-X)

### Build System
- #382 `4a412d4` Gitian hack so gitian Mac builds notify user about incompatibility on High Sierra (Jon Spock)

### Miscellaneous
- #332 `0c2cd61` [Docs] Add missing archived release notes (Fuzzbawls)

Credits
=======

Thanks to everyone who directly contributed to this release:
- Fuzzbawls
- Jon Spock
- Mrs-X
- presstab
- rejectedpromise

As well as everyone that helped translating on [Transifex](https://www.transifex.com/projects/p/metaaco-maco-translations/).