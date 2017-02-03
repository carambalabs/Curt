import UIKit

precedencegroup Constant {
    higherThan: AssignmentPrecedence, AdditionPrecedence
}
precedencegroup Constraint {
    higherThan: AssignmentPrecedence, Constant
}

infix operator ~ : Constraint
infix operator <= : Constraint
infix operator >= : Constraint
infix operator + : Constant
infix operator - : Constant

public func ~ (left: NSLayoutYAxisAnchor, right: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    let constraint = left.constraint(equalTo: right)
    constraint.isActive = true
    return constraint
}

public func ~ (left: NSLayoutXAxisAnchor, right: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    let constraint = left.constraint(equalTo: right)
    constraint.isActive = true
    return constraint
}

public func ~ (left: NSLayoutDimension, right: NSLayoutDimension) -> NSLayoutConstraint {
    let constraint = left.constraint(equalTo: right)
    constraint.isActive = true
    return constraint
}

public func ~ (left: NSLayoutDimension, right: CGFloat) -> NSLayoutConstraint {
    let constraint = left.constraint(equalToConstant: right)
    constraint.isActive = true
    return constraint
}

public func ~ (left: NSLayoutDimension, right: Int) -> NSLayoutConstraint {
    let constraint = left.constraint(equalToConstant: CGFloat(right))
    constraint.isActive = true
    return constraint
}

public func <= (left: NSLayoutYAxisAnchor, right: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    let constraint = left.constraint(lessThanOrEqualTo: right)
    constraint.isActive = true
    return constraint
}

public func >= (left: NSLayoutYAxisAnchor, right: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    let constraint = left.constraint(greaterThanOrEqualTo: right)
    constraint.isActive = true
    return constraint
}

public func <= (left: NSLayoutXAxisAnchor, right: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    let constraint = left.constraint(lessThanOrEqualTo: right)
    constraint.isActive = true
    return constraint
}

public func >= (left: NSLayoutXAxisAnchor, right: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    let constraint = left.constraint(greaterThanOrEqualTo: right)
    constraint.isActive = true
    return constraint
}

public func + (left: NSLayoutConstraint, right: CGFloat) -> NSLayoutConstraint {
    left.constant = right
    return left
}
public func + (left: NSLayoutConstraint, right: Int) -> NSLayoutConstraint {
    left.constant = CGFloat(right)
    return left
}
public func - (left: NSLayoutConstraint, right: CGFloat) -> NSLayoutConstraint {
    left.constant = -right
    return left
}
public func - (left: NSLayoutConstraint, right: Int) -> NSLayoutConstraint {
    left.constant = CGFloat(-right)
    return left
}

//let mainView = UIView()
//let header = UIView()
//let body = UIView()
//mainView.addSubview(header)
//mainView.addSubview(body)
//
//
//body.topAnchor.constraint(equalTo: header.topAnchor)
//body.topAnchor ~ header.topAnchor + CGFloat(10)
//
///// SPECS
//
//// Constrain anchor
//body.topAnchor ~ header.topAnchor
//
//// Add Constant
//body.topAnchor ~ header.topAnchor + 10
//body.topAnchor ~ header.topAnchor - 10
//body.topAnchor ~ header.topAnchor + CGFloat(10)
//
//// Specs
//
//body.topAnchor.constraint(equalTo: header.topAnchor).isActive = true
//body.topAnchor ~ header.topAnchor
//
//body.topAnchor.constraint(equalTo: header.topAnchor, constant: 10).isActive = true
//body.topAnchor ~ header.topAnchor + 10
//
//body.topAnchor.constraint(equalTo: header.topAnchor, constant: -10).isActive = true
//body.topAnchor ~ header.topAnchor - 10
//
//body.topAnchor.constraint(lessThanOrEqualTo: header.topAnchor).isActive = true
//body.topAnchor <= header.topAnchor
//
//body.topAnchor.constraint(lessThanOrEqualTo: header.topAnchor, constant: 10).isActive = true
//body.topAnchor <= header.topAnchor + 10
//
//body.topAnchor.constraint(greaterThanOrEqualTo: header.topAnchor)
//body.topAnchor >= header.topAnchor
//
//body.topAnchor.constraint(greaterThanOrEqualTo: header.topAnchor, constant: 10)
//body.topAnchor >= header.topAnchor + 10
//
//body.leadingAnchor.constraint(equalTo: header.leadingAnchor)
//body.leadingAnchor ~ header.leadingAnchor
//
//body.widthAnchor.constraint(equalToConstant: 10)
//body.widthAnchor ~ 10
//
//body.widthAnchor.constraint(equalTo: header.widthAnchor)
//body.widthAnchor ~ header.widthAnchor
//
//body.widthAnchor.constraint(equalTo: header.widthAnchor, multiplier: 0.5)
//
//body.widthAnchor.constraint(lessThanOrEqualToConstant: 10)
//
//body.widthAnchor.constraint(greaterThanOrEqualTo: header.widthAnchor, multiplier: 0.5)
//
//body.widthAnchor.constraint(greaterThanOrEqualTo: header.widthAnchor, multiplier: 0.5, constant: 10)

/*
 open func constraint(equalTo anchor: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint

 open func constraint(greaterThanOrEqualTo anchor: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint

 open func constraint(lessThanOrEqualTo anchor: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint

 open func constraint(equalTo anchor: NSLayoutAnchor<AnchorType>, constant c: CGFloat) -> NSLayoutConstraint

 open func constraint(greaterThanOrEqualTo anchor: NSLayoutAnchor<AnchorType>, constant c: CGFloat) -> NSLayoutConstraint

 open func constraint(lessThanOrEqualTo anchor: NSLayoutAnchor<AnchorType>, constant c: CGFloat) -> NSLayoutConstraint

 open func constraint(equalToConstant c: CGFloat) -> NSLayoutConstraint

 open func constraint(greaterThanOrEqualToConstant c: CGFloat) -> NSLayoutConstraint

 open func constraint(lessThanOrEqualToConstant c: CGFloat) -> NSLayoutConstraint

 open func constraint(equalTo anchor: NSLayoutDimension, multiplier m: CGFloat) -> NSLayoutConstraint

 open func constraint(greaterThanOrEqualTo anchor: NSLayoutDimension, multiplier m: CGFloat) -> NSLayoutConstraint

 open func constraint(lessThanOrEqualTo anchor: NSLayoutDimension, multiplier m: CGFloat) -> NSLayoutConstraint

 open func constraint(equalTo anchor: NSLayoutDimension, multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint

 open func constraint(greaterThanOrEqualTo anchor: NSLayoutDimension, multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint

 open func constraint(lessThanOrEqualTo anchor: NSLayoutDimension, multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint
 */
