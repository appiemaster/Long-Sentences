
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/UI }
using { /Fortnite.com/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Colors/NamedColors }
using { /Verse.org/Assets }
using { /Verse.org/Colors }
using { /Verse.org/Random }
using { /Fortnite.com/Characters }
using { /Fortnite.com/AI }



# Not localizable 

long_sentences := class(creative_device):

    LongTextBlock : text_block = text_block{DefaultTextColor := White}

    Len : int = 100

    ReallyLongString : string = "Nestled within the vibrant, ever-evolving virtual landscape of Fortnite, Pleasant Park stands as a cherished landmark, an icon of nostalgia, and a battlefield for countless digital warriors. Surrounded by verdant trees and set against the backdrop of a majestic mountain range, Pleasant Park exudes a quaint charm that belies the chaos that often unfolds within its boundaries. The central point of interest is its soccer field, where players often gather for impromptu games amidst the tumult of battle. The quaint suburban homes that encircle the park have been the sites of countless firefights, each house offering unique vantage points and strategic advantages. The clock tower, standing tall at the heart of the park, serves as a silent witness to the ongoing conflict, its chimes echoing across the battleground. As the storm approaches, players scavenge for weapons, resources, and ammunition, preparing themselves for the inevitable clash that will determine their fate. Pleasant Park is not just a location in Fortnite; it's a symbol of resilience, strategy, and the indomitable human spirit, where every tree, every house, and every blade of grass has borne witness to the highs and lows of countless battles. Whether you're dropping in for a quick skirmish or aiming for Victory Royale, Pleasant Park remains an iconic destination in the ever-expanding world of Fortnite, a place where memories are made, victories are celebrated, and legends are born. The serenity of the park, juxtaposed against the impending chaos, creates a unique atmosphere that draws players in, offering both solace and excitement in equal measure. As players navigate the terrain, they find themselves adapting to the ever-changing dynamics of the battlefield, using the landscape to their advantage, whether for cover or as a strategic vantage point. The sense of familiarity that Pleasant Park invokes makes it not just a location within the game, but a home away from home for many players, a place where they can forge unforgettable memories and partake in epic battles that will be recounted for ages to come. Each structure within Pleasant Park has its own story to tell, from the clock tower that has stood the test of time to the humble homes that have witnessed the ebb and flow of countless skirmishes. The beauty of Pleasant Park lies not only in its aesthetic appeal but also in its role as a stage for players to showcase their skill, strategy, and resilience. It is a place where friendships are forged, rivalries are kindled, and where the line between victory and defeat is drawn in the digital sand. As the sun sets over the tranquil landscape, casting long shadows across the park, the battle intensifies, and the true spirit of Fortnite is revealed. Pleasant Park remains a beacon of hope, a bastion of strategy, and a testament to the enduring legacy of one of the most iconic locations in the Fortnite universe."
    
    OnBegin<override>()<suspends>:void=
        for(Player : GetPlayspace().GetPlayers(), PlayerUI := GetPlayerUI[Player]):
            # PlayerUI.AddWidget(CreateWordCanvas())
        spawn{SkipLinesForString(ReallyLongString, Len, LongTextBlock)}

    SkipLinesForString(LongString : string, MaxLineLineLen : int, TextBlock : text_block)<suspends>:void=
        var InReallyLongString : string = ""
        var NeedToBreakSoon : logic = false
        for(Index -> Char : LongString):
            Sleep(0.1)
            var StrToAddTo : string = ""
            set InReallyLongString += "{Char}"
            if(NeedToBreakSoon?):
                if (LongString[Index + 1] = ' ' or Char = ' ' or not LongString[Index + 1]):
                    set StrToAddTo += "\n" 
                    set NeedToBreakSoon = false
            else:
                if( Mod[InReallyLongString.Length, MaxLineLineLen] = 0):
                    if (LongString[Index + 1] = ' ' or Char = ' ' or not LongString[Index + 1]):
                        set StrToAddTo += "\n" 
                    else set NeedToBreakSoon = true
            set InReallyLongString += StrToAddTo
            TextBlock.SetText(StringToMessage(InReallyLongString))

    StringToMessage<localizes>(S : string) : message = "{S}"

    CreateWordCanvas():canvas=
        return canvas:
            Slots := array:
                canvas_slot:
                    Widget := overlay:
                        Slots := array:
                            overlay_slot:
                                Widget := color_block:
                                    DefaultDesiredSize := vector2{X:= 794.46582, Y:= 258.539612}
                                    DefaultColor := Black
                                    DefaultOpacity := 0.7
                                HorizontalAlignment := horizontal_alignment.Fill
                                VerticalAlignment := vertical_alignment.Fill
                            overlay_slot:
                                Widget := LongTextBlock
                                HorizontalAlignment := horizontal_alignment.Center
                                VerticalAlignment := vertical_alignment.Center
                                Padding := margin{Top := 20.0}
                    Anchors := anchors{Minimum := vector2{X:= 0.0,  Y:= 0.0}, Maximum := vector2{X:= 1.0,  Y:= 1.0}}
