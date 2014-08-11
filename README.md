dc22hack
========

My Defcon 22 "Hack the Badge" competition entry.

=== I AM EMBARRASED BY THE QUALITY OF THIS CODE ===

This is the code AS IS for my competition entry.  This code was
written to be optimized for most amount of functionality in the
least amount of time.  It's not fit for anything  :-)

ALL of *my* code was written on-site with the exception of
some messy PoC code for the RFM69HCW module.  I wrote that
a few days before to see if this is a module I can standardize
on for one of my other projects.  I actually got the modules
I used shipped to defcon.  Next time I'll prepare and plan
accordingly but that's hard to do if you don't know what's
coming in the first place.

The code is horrifically bad and should NOT be used as any kind
of example of anything.

Its value is that it contains the only (currently available) driver
code for the RFM69HCW for the propeller.  I'm going to be writing
an ASM driver for it in the coming weeks but before I do, there is
enough here to get people started.

As time goes on, I will try and find time to re-factor that out
as a real object.

This is one of the worst examples of propeller code you'll find
anywhere.  In places I'm running code serially where it should
be running in parallel, I'm polling where I should be setting a
CPU to sleep and wake on the module's IRQ.  I'm cutting and pasting
instead of using repeat 2.  Ugh.

I no longer own any of the hardware for my badge so it will be
a week or two before I can replicate it.  Once I do I will
re-factor the code so people can see what the real code is meant
to look like.

The badge is now owned by Defcon and will be auctioned off for
the EFF next year where hopefully it will do some good!

RF Module: http://www.anarduino.com/details.jsp?pid=162
DC22 Badge Thread: http://forums.parallax.com/showthread.php/156782-DEFCON-22-Badge-Code-Schematics-and-Information-Here!
My BadgeHack Thread: http://forums.parallax.com/showthread.php/156862-__red__-s-Defcon-22-quot-Hack-the-Badge-quot-write-up.

Enjoy!



__red__

Thanks to:
Jon, 1o57 and Parallax for the awesome badge to start with.

Everyone @DC22 who came out and played with it and/or asked questions,
those who bought me drinks while I worked on it in HHV and the kind
gentleman whose name I don't remember who gave me 10 minutes of his talk-time
in the HHV village to talk about it.

Felix Rusu (felix@lowpowerlab.com): Example code in C
(https://github.com/LowPowerLab/RFM69)

ZeroChaos: For this video https://www.youtube.com/watch?v=c3bpN9eHe5o
which talks about the damage caused to our community by not publishing
code because "it's only a small hack" or "I'll publish it after I
tidy it up".

HopeRF: who took my "extremely fast" order to ship to Defcon as an
exception to their shipping process so it could conform to the Rio's
bizzare "incoming mail requirements for guests".


