//
//  FlowLayout.swift
//  CampusNavigatorApp
//
//  Created by sasiri rukshan nanayakkara on 2/24/25.
//

import SwiftUI

struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(in: proposal.width ?? 0, subviews: subviews, spacing: spacing)
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
        for (index, line) in result.lines.enumerated() {
            let y = bounds.minY + result.lineYs[index]
            var x = bounds.minX
            
            for elementIndex in line {
                let view = subviews[elementIndex]
                view.place(at: CGPoint(x: x, y: y), proposal: .unspecified)
                x += view.sizeThatFits(.unspecified).width + spacing
            }
        }
    }
    
    struct FlowResult {
        var lines: [[Int]] = [[]]
        var lineYs: [CGFloat] = [0]
        var size: CGSize = .zero
        
        init(in width: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var x: CGFloat = 0
            var y: CGFloat = 0
            var maxHeight: CGFloat = 0
            var lineIndex = 0
            
            for (index, view) in subviews.enumerated() {
                let size = view.sizeThatFits(.unspecified)
                
                if x + size.width > width && !lines[lineIndex].isEmpty {
                    lineIndex += 1
                    lines.append([])
                    x = 0
                    y += maxHeight + spacing
                    lineYs.append(y)
                    maxHeight = 0
                }
                
                lines[lineIndex].append(index)
                x += size.width + spacing
                maxHeight = max(maxHeight, size.height)
                self.size.width = max(self.size.width, x)
            }
            
            self.size.height = y + maxHeight
        }
    }
}
